From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: NV46 disconnected VGA
Date: Tue, 26 Apr 2011 18:58:48 +0300
Message-ID: <20110426185848.0a007ceb@farn.lan>
References: <951193.71954.qm@web161608.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <951193.71954.qm-TyUnntYMKjL9UXy7m5qddZEhsgyP+Z75VpNB7YpNyf8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 26 Apr 2011 01:58:01 -0700 (PDT)
Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:

> Hi,
> 
> I have an unexpected problem: the chip recognized as NV46 does
> not connnect/display VGA on LCD.
> Using mesa/gallium and xorg-server/xf86-video-nouveau from git,
> kernel 2.6.38, device in /etc/X11/xorg.conf:
> 
> Section "Device"
>     Identifier    "NVIDIA NV46"
>     VendorName    "NVIDIA Corp"
>     Driver        "nouveau"
> 
>     Option        "Monitor-LVDS-1"    "LCD 15.4'' WXGA"
>     Option        "Monitor-VGA-1"        "LCD"
>     Option        "Monitor-TV-1"        "<Missing>"
> 
>     Option        "HW_cursor"        "true"
>     Option        "ModeDebug"        "On"
> EndSection

What are you trying to achieve with this config, exactly?
I'm not familiar with the impications of those options, but
it seems the X server is parsing those as separate SCREENs.
Are you therefore attempting Zaphod mode?
http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop

Have you tried the minimal config, as instructed in
http://nouveau.freedesktop.org/wiki/TroubleShooting ?

What does the kernel say about the outputs in the log?

Has your VGA-monitor's DDC worked before?


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
