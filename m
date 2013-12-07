From: Benjamin Morris <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: H.264 engine differences between fermi and tesla cards
Date: Fri, 6 Dec 2013 16:36:12 -0800
Message-ID: <20131206163612.0b9501ee@bmorris-dev>
References: <20131121140711.7154f62a@bmorris-dev>
	<CAKb7UvgEhxuZhPEMA63Un_AWBNx9dhbDSoAbcYn_QF_DLZqrcQ@mail.gmail.com>
	<CAKb7UvgcqusTdaf==mzYWRVUUp8UQukCv_h894ix3MdRXHDhrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgcqusTdaf==mzYWRVUUp8UQukCv_h894ix3MdRXHDhrQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, 30 Nov 2013 12:54:45 -0800
Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> On Thu, Nov 21, 2013 at 5:22 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> wrote:
> > On Thu, Nov 21, 2013 at 5:07 PM, Benjamin Morris
> > <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> >> On 11/19/2013 08:16 PM, Ilia Mirkin wrote:
> >>> Hello,
> >>>
> >>> I hope this is an appropriate style of request for this forum. I
> >>> added code to support video decoding on the tesla cards that have
> >>> a similar-style video decoding engine to fermi cards (i.e. G98,
> >>> GT21x, the IGP's -- the falcon-controlled decoding engines,
> >>> rather than the xtensa-controlled ones), by using pretty much the
> >>> same logic that we had for the fermi cards. This worked great for
> >>> MPEG-2 and VC-1. However for H.264 videos, it appears to decode a
> >>> few frames, and then the engine hangs.
> >>>
> >>> In traces, I noticed that the nvidia driver reloads the BSP/VP/PPP
> >>> engines every second or so. Is this done as a powersaving
> >>> technique, or is it done as a workaround for some issue? Does
> >>> nouveau need to do the same thing? If so, any specifics on the
> >>> reload condition?
> >>>
> >>> Any other ideas as to what might be going wrong? Are there some
> >>> subtle differences between the fermi and pre-fermi engines? Or a
> >>> difference when decoding H.264 files vs MPEG2/VC1 files? Perhaps
> >>> there's other information I can provide. BTW, this is with using
> >>> the firmware blobs from the NVIDIA proprietary driver.
> >>>
> >>> Thanks,
> >>>
> >>>   -ilia
> >>
> >> As you observed, the nvidia driver unloads the video engines on
> >> certain GPUs when they go idle to save power.  You can disable
> >> this behavior by loading the nvidia kernel module with: modprobe
> >> nvidia NVreg_RegistryDwords="RMPowerFeature=64"
> >>
> >> Regarding your H.264 hangs, the most likely cause is
> >> mis-programming the video engine.  I suggest double-checking that
> >> the nouveau driver sends the exact same parameters for each decode
> >> operation as the nvidia driver does.  In particular, check that
> >> buffer alignments match up, as those may vary between GPU
> >> generations.
> >
> > Thanks a lot for the response! I've set aside some time this weekend
> > to debug this some more, I'll be sure to pay special attention to
> > how we're computing the various buffer sizes and their alignments.
> 
> So... I just did some experimenting, and it's not looking good for the
> buffer alignment theory. For the same video, with the same nouveau
> code, it plays back a variable amount. It normally gets through
> 150-160 frames before the VP engine hangs. (This isn't a hard hang, it
> just never finishes processing the frame.) I've looked at what we send
> on the different runs into the FIFO, and it appears to be completely
> identical between runs, down to the exact addresses of all the
> buffers. So there's some non-determinism in there somewhere.
> 
> I analyzed the data being pushed fairly carefully, both by the nvidia
> driver and nouveau. I did note some differences, but making
> adjustments to the nouveau code just made things worse, it would only
> get through 1-50 frames before hanging in the same way. I probably
> didn't quite understand something.
> 
> I should have asked this directly in my original request, but is there
> any chance that NVIDIA could release the ABI docs for its video
> playback firmware? I wouldn't need a full-on spec, just enough bits to
> get H.264 going (since the rest work just fine already). Specifically
> buffer sizing/alignment, and what any "non-obvious" values are in the
> parameters passed to BSP/VP/PPP engines. No need to talk about
> reference frame management or the crypto stuff.
> 
> Thanks,
> 
>   -ilia

I've gathered a few hints regarding H264 video decoding on our hardware.  Hopefully some of them will be useful.

First off, regarding naming in general.  Our internal names for our video engines differ from the names you've been using.  Below is a translation map between the names on http://nouveau.freedesktop.org/wiki/VideoAcceleration/ and our internal names.  This is more of an FYI than anything else, to help translation; I don't expect it to help with this particular H264 hang.

VP2 (same)
VP3   -> MSDEC
VP4.0 -> MSDEC2
VP4.2 -> MSDEC3
VP5   -> MSDEC4

Looking at your code, it seems that you're instantiating all 3 engines (VLD, PDEC, PPP) on the same channel.  This probably isn't causing the hang, but it's bad practice in general, as it prevents the engines from running in parallel.  It's also impossible to use multiple engines on the same channel like this on MSDEC4 (VP5) GPUs, so the same separate channel usage that you need to have for MSDEC4 should also be used for everything down to G84.

Regarding "non-obvious" values for H264 decoding, looking at nouveau_vp3_video_vp.c, it looks like there are several unknown values in the H264 picture parameter structure, especially for the DPB reference table.  This seems like a potential cause for your MSDEC[12]-specific hangs; incorrect DPB state can be difficult to figure out from picture parameter dumps, and the PDEC response to incorrect DPB state is generally to simply hang.  There are no significant differences between MSDEC[12] (your VP3/VP4.0) and MSDEC3 (your VP4.2) regarding DPB state, but improvements in error resilience/concealment may simply be masking the problem on MSDEC3.  Below I've filled in our names for unnamed fields in that structure.  Hopefully this allows you to make some quick progress; you can apply the same l
 ogic you already have for G84 to your G98 code path.

Thanks,
Ben

struct h264_picparm_vp { // 700..a00
	uint16_t width, height;
	uint32_t stride1, stride2; // 04 08
	uint32_t ofs[6]; // 0c..24 in-image offset

	uint32_t u24; // nfi ac8 ? -> ColocBufferSize
	uint32_t bucket_size; // 28 bucket size
	uint32_t inter_ring_data_size; // 2c

	unsigned f0 : 1; // 0 0x01: into 640 shifted by 3, 540 shifted by 5, half size something? -> MbaffFrameFlag
	unsigned f1 : 1; // 1 0x02: into vuc ofs 56 -> direct_8x8_inference_flag
	unsigned weighted_pred_flag : 1; // 2 0x04
	unsigned f3 : 1; // 3 0x08: into vuc ofs 68 -> constrained_intra_pred_flag
	unsigned is_reference : 1; // 4
	unsigned interlace : 1; // 5 field_pic_flag
	unsigned bottom_field_flag : 1; // 6
	unsigned f7 : 1; // 7 0x80: nfi yet -> second_field (second field of complementary reference field)

	signed log2_max_frame_num_minus4 : 4; // 31 0..3
	unsigned u31_45 : 2; // 31 4..5 -> chroma_format_idc
	unsigned pic_order_cnt_type : 2; // 31 6..7
	signed pic_init_qp_minus26 : 6; // 32 0..5
	signed chroma_qp_index_offset : 5; // 32 6..10
	signed second_chroma_qp_index_offset : 5; // 32 11..15

	unsigned weighted_bipred_idc : 2; // 34 0..1
	unsigned fifo_dec_index : 7; // 34 2..8
	unsigned tmp_idx : 5; // 34 9..13 -> CurrColIdx (index of associated co-located motion data buffer)
	unsigned frame_number : 16; // 34 14..29
	unsigned u34_3030 : 1; // 34 30..30 pp.u34[30:30]
	unsigned u34_3131 : 1; // 34 31..31 pad?

	uint32_t field_order_cnt[2]; // 38, 3c

	struct { // 40
		// 0x00223102
		// nfi (needs: top_is_reference, bottom_is_reference, is_long_term, maybe some other state that was saved..
		unsigned fifo_idx : 7; // 00 0..6 -> buffer id
                // tmp_idx is the index of the associated co-located motion data buffer
                // for simplest management, ensure that this is always equal to the buffer id
		unsigned tmp_idx : 5; // 00 7..11
		unsigned unk12 : 1; // 00 12 not seen yet, but set, maybe top_is_reference -> top_is_reference
		unsigned unk13 : 1; // 00 13 not seen yet, but set, maybe bottom_is_reference? -> bottom_is_reference
		unsigned unk14 : 1; // 00 14 skipped? -> is_long_term
		unsigned notseenyet : 1; // 00 15 pad? -> not_existing
		unsigned unk16 : 1; // 00 16 -> is_field_pair
		unsigned unk17 : 4; // 00 17..20 -> top_field_marking (top_is_reference ? 1+is_long_term : 0)
		unsigned unk21 : 4; // 00 21..24 -> bottom_field_marking
		unsigned pad : 7; // 00 d25..31

		uint32_t field_order_cnt[2]; // 04,08
		uint32_t frame_idx; // 0c
	} refs[0x10];

	uint8_t m4x4[6][16]; // 140
	uint8_t m8x8[2][64]; // 1a0
	// most of the remaining is MVC or SVC setup info, filled zero if not MVC or SVC
	uint32_t u220; // 220 number of extra reorder_list to append?
	uint8_t u224[0x20]; // 224..244 reorder_list append ?
	uint8_t nfi244[0xb0]; // add some pad to make sure nulls are read
};
