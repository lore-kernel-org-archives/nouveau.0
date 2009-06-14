From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Syncing to vblank for interlaced video modes
Date: Sun, 14 Jun 2009 10:39:24 -0400
Message-ID: <586c2acd0906140739x77cf14d2vf15d070378252574@mail.gmail.com>
References: <20090614223218.a3b6ce8e.hutts@internode.on.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090614223218.a3b6ce8e.hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 14, 2009 at 8:32 AM, Jamie Smith<hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org> wrote:
> Hello,
>
> I wish to make a change to the nouveau source.  You might say I am considering becoming a nouveau developer.  I am one of those crazy nutters who connects my nvidia card directly to a television via a vga2scart cable using interlaced video modes.  As you are probably aware, interlaced video signals generate two alternating half frames or 'fields', which the interlaced display cleverly weaves together to form a full picture.
>
> DVD playing software typically works by generating a progressive video stream by combining two consecutive (first and second) fields to produce a full progressive frame.  For the purpose of displaying true interlaced video (e.g. DVD) to an interlaced television, without using deinterlacing, the full video frames need to be written to the linear video buffer during the retrace after the second frame is drawn, so that both fields are ready to be output in correct order to the display.
>
> The current proprietary drivers from nVidia synchronise buffer updates to the retrace after each single half frame is drawn, which for the most part is not satisfactory.  The symptoms of this are explained very well in this post -> http://www.nvnews.net/vbulletin/showthread.php?t=95836
>
> If I understand, the nouveau drivers currently use the standard vga crtc registers to detect video retrace, and this results in the same behaviour.  According to specifications I have seen from AMD, at least one Radeon series has registers which tell which field(first or second) is currently being drawn, and which field will be next.  I'm going to assume the nVidia cards have something similar, and I'm hoping someone may either a) know this information already so I can make a pretty simple change or b) suggest a way that I might find out this information.

Hi,

From my understanding, for textured video we stick a commands in the
fifo that basically sleep the channel until the start of the next
vblank. Look for NVWaitVSync. We call it in the various
NV*PutTexturedImage functions. I think the overlay is (probably)
automatically locked to the vblank.

If I understand you correctly you want the same image to be displayed
for two frames, i.e. when the tv is showing the first and second
fields.

There's no parameter for that in Xv to know which field a particular
XvPutImage corresponds to as far as I know. In fact I'm not even sure
if Xv knows anything about interlaced video, seems we just get full
frames from the player and display them. XvMC seems a little better,
XvMCPutSurface has first and second field params, so you would then
sync only after the 2nd field is drawn I take it?
