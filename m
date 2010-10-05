From: walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Trouble with building xf86-video-nouveau
Date: Tue, 05 Oct 2010 10:17:05 -0700
Message-ID: <i8fmiq$2uf$1@dough.gmane.org>
References: <39cd79ff15131cff86908d06f0863e8f3dad41ea@mail.qip.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <39cd79ff15131cff86908d06f0863e8f3dad41ea-00AcXzPn1AMox3rIn2DAYQ@public.gmane.org>
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

On 10/04/2010 10:38 PM, noname_oz-EE1Pc4pW+aiHXe+LvDLADg@public.gmane.org wrote:
> I have problem with building nouveau driver. I already have installed latest versions of mesa and libdrm. In process of building i have this error:
>
> drmmode_display.c: In function drmmode_xf86crtc_resize:
> drmmode_display.c:1076: error: struct _ScrnInfoRec has no member namedpixmapPrivate

Two wild guesses.  Do you have the proprietary nvidia-drivers package installed?
If so, run 'eselect opengl list' to find out which version you are using.  Try
switching to the xorg-x11 version.

The *-9999 package just pulls from the git repository and build whatever code
happens to be there at the time.  Try re-installing the package again to get
any commits you may have missed the first time.
