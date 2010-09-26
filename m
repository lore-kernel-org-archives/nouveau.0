From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Problems with the driver
Date: Sun, 26 Sep 2010 17:10:55 +0200
Message-ID: <20100926151055.GA3284@joi.lan>
References: <4C9F54F2.1010108@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4C9F54F2.1010108-hcDgGtZH8xNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Piotr Hosowicz <piotr-aAmyfUXO971Wk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Sep 26, 2010 at 04:13:06PM +0200, Piotr Hosowicz wrote:
> Hello,
> 
> I can build the driver, it loads, but it does not work. Please find 
> attached my local data, sorry for the form, I made it a few days ago and 
> would have to build a new kernel which would also not work. My card is 
> 01:00.0 VGA compatible controller: nVidia Corporation G96 [GeForce 9400 
> GT] (rev a1). The things stay the same, never mind how I try.
> 

You have 0.0.16 nouveau kernel module, but 0.0.15 libdrm/xf86-video-nouveau.
This is probably your main problem. Upgrade libdrm and xf86-video-nouveau.

Note, you didn't uninstall NVIDIA proprietary driver (Module glx: 
endor="NVIDIA Corporation" in xorg.log) which might crash X if wrong
version of some component is installed (don't remember which one, just
uninstall nvidia drivers)

If you resolve these issues and still have problem, simplify your xorg.conf
to contain only:

Section "Device"
Identifier "n"
Driver "nouveau"
EndSection

Almost all above is documented on wiki: http://nouveau.freedesktop.org/wiki/TroubleShooting


Marcin
