From: Dirk Thierbach <dthierbach-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Sun, 14 Jun 2009 20:34:42 +0200
Message-ID: <20090614183442.GA13749@feanor>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Jamie Smith<hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org> wrote:

>> I am one of those crazy nutters who connects my nvidia card
>> directly to a television via a vga2scart cable using interlaced
>> video modes.

>> For the purpose of displaying true interlaced video (e.g. DVD) to
>> an interlaced television, without using deinterlacing, the full
>> video frames need to be written to the linear video buffer during
>> the retrace after the second frame is drawn, so that both fields
>> are ready to be output in correct order to the display.

Alternatively, it would probably be enough to write the frames
in the right order, i.e. write the even frame when the card displays
the even frame, etc.

>> If I understand, the nouveau drivers currently use the standard vga
>> crtc registers to detect video retrace, and this results in the same
>> behaviour.  According to specifications I have seen from AMD, at
>> least one Radeon series has registers which tell which field(first
>> or second) is currently being drawn, and which field will be next.

The register 0x600808 (PCRTC_RASTER) contains this information in bit 20
(0=even, 1=odd), at least for older cards. I have no idea if this register
is valid on your concrete hardware (and I don't even now which hardware
that is).

> If I understand you correctly you want the same image to be displayed
> for two frames, i.e. when the tv is showing the first and second
> fields.

> There's no parameter for that in Xv to know which field a particular
> XvPutImage corresponds to as far as I know. 

And that's the main problem, actually. There's the X SYNC extension

http://lesstif.sourceforge.net/doc/super-ux/g1ae04e/chap9.html

which provides synchronization counters that can be used to make this
information available (this has been discussed on the xorg mailing
list some years ago, BTW).

So you'd have to patch Noveau to provide a SYNC counter (maybe on
request), where the lowest bit of the sync counter should reflect if
it's an even or odd field, and then you've to patch your favorite
movie player to make use of this information and, say, delay for
one frame when it starts playing but the current field is odd, so that
even fields fall on even fields. You'd probably also need to take
any delays caused buffering into account.

Doable, but not easy.

- Dirk
