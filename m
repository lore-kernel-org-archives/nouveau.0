From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: H.264 engine differences between fermi and tesla cards
Date: Fri, 6 Dec 2013 23:24:03 -0500
Message-ID: <CAKb7UviYpCiueet3rqcGdAeERVSVEe_rm8c6GTzFsMvnHMpLsQ@mail.gmail.com>
References: <20131121140711.7154f62a@bmorris-dev>
	<CAKb7UvgEhxuZhPEMA63Un_AWBNx9dhbDSoAbcYn_QF_DLZqrcQ@mail.gmail.com>
	<CAKb7UvgcqusTdaf==mzYWRVUUp8UQukCv_h894ix3MdRXHDhrQ@mail.gmail.com>
	<20131206163612.0b9501ee@bmorris-dev>
	<CAKb7UvhjLpvdet161kyJi4oKWjqYrcT5oY+A+0+PUPQVjMtr+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhjLpvdet161kyJi4oKWjqYrcT5oY+A+0+PUPQVjMtr+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Benjamin Morris <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, gpu-public-documentation <gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Ignore my previous questions. (Or answer them, it's always interesting
to hear what the "right" answers are rather than "close enough".)

Thanks for going over the h264 picparm format, most of the fields you
mentioned were already being set as you described, just not properly
documented in the struct you saw. However a couple were being set
incorrectly/not at all (esp the long term reference-frame related
ones... since no actual videos with that set exist, at least not in my
library).

Want to know what it was? Storage settings. Ugh. The "ref_bo" (the
buffer containing the reference frame data as well as a few other
things) was created with a tile mode/memtype, while the others
weren't. I removed those settings, and it's all fine now. I'm going to
play around with it some more, perhaps that ref_bo ought to be split
up into two, since I suspect that having those turned on would be
beneficial for performance when dealing with image data. (And why did
it work with VC1? Who knows.) And of course the Fermi+ code handles
this differently since the storage parameters are all different (and
it sets them for *all* bo's handed to the video decoding engines).

Apologies for this being such a "trivial" issue, and I had totally
forgotten about the storage type. When I was working with VP2 setting
it incorrectly just meant misrendered images, not engine hangs.

Cheers,

  -ilia

On Fri, Dec 6, 2013 at 8:06 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Fri, Dec 6, 2013 at 7:36 PM, Benjamin Morris <bmorris-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> I've gathered a few hints regarding H264 video decoding on our hardware.  Hopefully some of them will be useful.
>
> Very useful!
>
>>
>> First off, regarding naming in general.  Our internal names for our video engines differ from the names you've been using.  Below is a translation map between the names on http://nouveau.freedesktop.org/wiki/VideoAcceleration/ and our internal names.  This is more of an FYI than anything else, to help translation; I don't expect it to help with this particular H264 hang.
>>
>> VP2 (same)
>> VP3   -> MSDEC
>> VP4.0 -> MSDEC2
>> VP4.2 -> MSDEC3
>> VP5   -> MSDEC4
>>
>> Looking at your code, it seems that you're instantiating all 3 engines (VLD, PDEC, PPP) on the same channel.  This probably isn't causing the hang, but it's bad practice in general, as it prevents the engines from running in parallel.  It's also impossible to use multiple engines on the same channel like this on MSDEC4 (VP5) GPUs, so the same separate channel usage that you need to have for MSDEC4 should also be used for everything down to G84.
>
> First off, thank you so much for diving into our code! Hope it wasn't
> _too_ dirty :)
>
> Yeah, for Kepler, we put things on separate channels. When I did the
> VP2 implementation, I also put them on separate channels since it
> seemed like that was what was being done from the traces (and I knew
> much less about all these things back then). But when I was doing the
> initial pass to get MSDEC[12] working based on existing MSDEC[34]
> code, I just left it alone, and it had them on the same channel for
> pre-kepler. There's some limitation in nouveau that prevents multiple
> channels from being active anyways (or something like that, it was
> explained to me, but I don't quite remember right now), so it won't
> matter either way for now. But in the future the plan is definitely to
> move to separate channels.
>
>>
>> Regarding "non-obvious" values for H264 decoding, looking at nouveau_vp3_video_vp.c, it looks like there are several unknown values in the H264 picture parameter structure, especially for the DPB reference table.  This seems like a potential cause for your MSDEC[12]-specific hangs; incorrect DPB state can be difficult to figure out from picture parameter dumps, and the PDEC response to incorrect DPB state is generally to simply hang.  There are no significant differences between MSDEC[12] (your VP3/VP4.0) and MSDEC3 (your VP4.2) regarding DPB state, but improvements in error resilience/concealment may simply be masking the problem on MSDEC3.  Below I've filled in our names for unnamed fields in that structure.  Hopefully this allows you to make some quick progress; you can apply the sam
 e logic you already have for G84 to your G98 code path.
>
> Great. There are few acronyms in there that I'm not familiar with, but
> I suspect sufficient documentation-reading will fix the problem.
>
> One additional question is whether you have any comments on our
> inter-engine buffer sizing/usage (inter_data). Specifically the 0x720
> method for VP (PDEC?) and 0x414 method on BSP (VLD?). Right now we set
> that to the same address/size, but I noticed that you offset them by
> 0x2100 (iirc). However when I did that, it just caused the engine to
> hang faster. (But then I noticed that on 331.20, which is what I used
> for my latest traces, the "kernel" fuc code had been updated from the
> one that we're extracting with my fw-cutter script, so perhaps the ABI
> has changed. Or perhaps the fw-cutter has an insufficiently-precise
> signature... I'll check it out later.)
>
> I will look at your comments on our picparm data structure and will
> adjust our code. Hopefully that's all that's needed.
>
> Thanks again!
>
>   -ilia
>
>>
>> Thanks,
>> Ben
>>
>> struct h264_picparm_vp { // 700..a00
>>         uint16_t width, height;
>>         uint32_t stride1, stride2; // 04 08
>>         uint32_t ofs[6]; // 0c..24 in-image offset
>>
>>         uint32_t u24; // nfi ac8 ? -> ColocBufferSize
>>         uint32_t bucket_size; // 28 bucket size
>>         uint32_t inter_ring_data_size; // 2c
>>
>>         unsigned f0 : 1; // 0 0x01: into 640 shifted by 3, 540 shifted by 5, half size something? -> MbaffFrameFlag
>>         unsigned f1 : 1; // 1 0x02: into vuc ofs 56 -> direct_8x8_inference_flag
>>         unsigned weighted_pred_flag : 1; // 2 0x04
>>         unsigned f3 : 1; // 3 0x08: into vuc ofs 68 -> constrained_intra_pred_flag
>>         unsigned is_reference : 1; // 4
>>         unsigned interlace : 1; // 5 field_pic_flag
>>         unsigned bottom_field_flag : 1; // 6
>>         unsigned f7 : 1; // 7 0x80: nfi yet -> second_field (second field of complementary reference field)
>>
>>         signed log2_max_frame_num_minus4 : 4; // 31 0..3
>>         unsigned u31_45 : 2; // 31 4..5 -> chroma_format_idc
>>         unsigned pic_order_cnt_type : 2; // 31 6..7
>>         signed pic_init_qp_minus26 : 6; // 32 0..5
>>         signed chroma_qp_index_offset : 5; // 32 6..10
>>         signed second_chroma_qp_index_offset : 5; // 32 11..15
>>
>>         unsigned weighted_bipred_idc : 2; // 34 0..1
>>         unsigned fifo_dec_index : 7; // 34 2..8
>>         unsigned tmp_idx : 5; // 34 9..13 -> CurrColIdx (index of associated co-located motion data buffer)
>>         unsigned frame_number : 16; // 34 14..29
>>         unsigned u34_3030 : 1; // 34 30..30 pp.u34[30:30]
>>         unsigned u34_3131 : 1; // 34 31..31 pad?
>>
>>         uint32_t field_order_cnt[2]; // 38, 3c
>>
>>         struct { // 40
>>                 // 0x00223102
>>                 // nfi (needs: top_is_reference, bottom_is_reference, is_long_term, maybe some other state that was saved..
>>                 unsigned fifo_idx : 7; // 00 0..6 -> buffer id
>>                 // tmp_idx is the index of the associated co-located motion data buffer
>>                 // for simplest management, ensure that this is always equal to the buffer id
>>                 unsigned tmp_idx : 5; // 00 7..11
>>                 unsigned unk12 : 1; // 00 12 not seen yet, but set, maybe top_is_reference -> top_is_reference
>>                 unsigned unk13 : 1; // 00 13 not seen yet, but set, maybe bottom_is_reference? -> bottom_is_reference
>>                 unsigned unk14 : 1; // 00 14 skipped? -> is_long_term
>>                 unsigned notseenyet : 1; // 00 15 pad? -> not_existing
>>                 unsigned unk16 : 1; // 00 16 -> is_field_pair
>>                 unsigned unk17 : 4; // 00 17..20 -> top_field_marking (top_is_reference ? 1+is_long_term : 0)
>>                 unsigned unk21 : 4; // 00 21..24 -> bottom_field_marking
>>                 unsigned pad : 7; // 00 d25..31
>>
>>                 uint32_t field_order_cnt[2]; // 04,08
>>                 uint32_t frame_idx; // 0c
>>         } refs[0x10];
>>
>>         uint8_t m4x4[6][16]; // 140
>>         uint8_t m8x8[2][64]; // 1a0
>>         // most of the remaining is MVC or SVC setup info, filled zero if not MVC or SVC
>>         uint32_t u220; // 220 number of extra reorder_list to append?
>>         uint8_t u224[0x20]; // 224..244 reorder_list append ?
>>         uint8_t nfi244[0xb0]; // add some pad to make sure nulls are read
>> };
