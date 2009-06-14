From: Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
Subject: Syncing to vblank for interlaced video modes
Date: Sun, 14 Jun 2009 22:32:18 +1000
Message-ID: <20090614223218.a3b6ce8e.hutts@internode.on.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hello,

I'll start by applauding your efforts to make an open source driver for nv hardware.  I imagine it is a very difficult task trying to reverse engineer hardware and produce something useful and featureful.

I wish to make a change to the nouveau source.  You might say I am considering becoming a nouveau developer.  I am one of those crazy nutters who connects my nvidia card directly to a television via a vga2scart cable using interlaced video modes.  As you are probably aware, interlaced video signals generate two alternating half frames or 'fields', which the interlaced display cleverly weaves together to form a full picture.

DVD playing software typically works by generating a progressive video stream by combining two consecutive (first and second) fields to produce a full progressive frame.  For the purpose of displaying true interlaced video (e.g. DVD) to an interlaced television, without using deinterlacing, the full video frames need to be written to the linear video buffer during the retrace after the second frame is drawn, so that both fields are ready to be output in correct order to the display.

The current proprietary drivers from nVidia synchronise buffer updates to the retrace after each single half frame is drawn, which for the most part is not satisfactory.  The symptoms of this are explained very well in this post -> http://www.nvnews.net/vbulletin/showthread.php?t=95836

If I understand, the nouveau drivers currently use the standard vga crtc registers to detect video retrace, and this results in the same behaviour.  According to specifications I have seen from AMD, at least one Radeon series has registers which tell which field(first or second) is currently being drawn, and which field will be next.  I'm going to assume the nVidia cards have something similar, and I'm hoping someone may either a) know this information already so I can make a pretty simple change or b) suggest a way that I might find out this information.

Sincerely,

Jamie.

-- 
Jamie Smith <hutts-CkBdp7X+a1oIQCUVoCVjmQ@public.gmane.org>
