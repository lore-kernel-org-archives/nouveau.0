From: Andrew Randrianasulu <randrianasulu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: vp3 hang on mplayer exit (for GT240 videocard) -
 workaround found?
Date: Thu, 13 Aug 2020 21:30:28 +0300
Message-ID: <202008132130.29041.randrianasulu@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Apparently, this hang can be fixed at small performance cost by setting

NOUVEAU_VP3_DEBUG_FENCE 1 (as opposed to default 0)
in https://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/nouveau_vp3_video.h

Now, what exactly fixes my hangs (or make them less severe) - still open question, 
guess I can flip few of those debug defines and try to find out ...

Currently at mesa Mesa 20.3.0-devel (git-8557b1a8eb)

I can launch two of those VIDEO:  [H264]  1920x1080  0bpp  59.940 fps and it will not hang
Even survived 5 x 1080p h264 (30 fps) videos - it was slideshow (due to DRI_PRIME ?)
but it does not hang ....
