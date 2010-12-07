From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "Decode videos"
Date: Mon, 6 Dec 2010 20:11:16 -0900
Message-ID: <20101207051116.GD4066@localhost2.local>
References: <AANLkTimLWGd5Qp8ARTUy5ru8Uwm_H2=B-0nCAys4yK3W@mail.gmail.com>
	<AANLkTikufPCJWBMJt2A6yRzA9q2bH-x9zf4KJ6+WySHB@mail.gmail.com>
	<20101206200707.4793a30a@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101206200707.4793a30a-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Dec 06, 2010 at 08:07:07PM -0500, Jimmy Rentz wrote:
>Initially I would say XVMC.  VDPAU expects full hw bitstream
>decode.  XVMC only does decode starting at idct/mb.  I am guessing it
>is possible to support VDPAU by doing the earlier stages in software
>then handling the reset to hw.  Well, unless someone figures out some
>way to handle the full pipeline in hw via shaders which is something
>I have no time or knowledge.  
>
>The latest version of the video decode/vpe/nv40 patches are here:
>http://people.freedesktop.org/~jb17bsome/vpe/ddx/ddx_nouveau_vpe_v1.patch
>http://people.freedesktop.org/~jb17bsome/vpe/drm/drm_nouveau_vpe_v5.patch
>http://people.freedesktop.org/~jb17bsome/vpe/kernel/kernel_nouveau_vpe_v6.patch
>http://people.freedesktop.org/~jb17bsome/vpe/mesa/mesa_pipe_video_nouveau_vpe_v3.patch 
>For mesa you need to pull the pipe-video branch.  All the others apply
>fine against the latest branches for the ddx, drm, nouveau kernel.
>
>The current patches integrate vpe better with gem/ttm.  This means
>that relocs/fences are emitted and it doesn't just pin all memory like
>before. Though, it does runs much slower compared to my last non-gem
>version located under the old directories in (ddx/drm/kernel/mesa).  I
>am fairly certain from oprofile dumps that it is because of too many
>relocs emitted or something, but I haven't followed up.
>
>Anyway hopes this helps.
>
>Jimmy

Just a quick ping on this topic.

I have 2 video cards with XvMC capabilities on 450P3 and 2x750P3 CPU's, of
which, XvMC is required for playback of high resolution video... unless
I use the rough MPlayer slow CPU scaling hacks.

I hopefully plan to experiment with the XvMC patches in the near future.

-- 
Roger
http://rogerx.freeshell.org/
