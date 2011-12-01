From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau driver is not loading
Date: Thu, 1 Dec 2011 01:25:55 -0500
Message-ID: <CAMVNhxQTizDCJ8utXW=Mr=ktu3S_6SozYg2+vqAcbEz8V9PvAg@mail.gmail.com>
References: <20111129210404.162990@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20111129210404.162990-hi6Y0CQ0nG0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lars Callenbach <lars.callenbach-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Nov 29, 2011 at 4:04 PM, Lars Callenbach <lars.callenbach-Mmb7MZpHnFY@public.gmane.org> w=
rote:
> Hello,
>
> I have installed git-kernel (3.2-rc3) with git-drm libs on debian. nvidia=
fb on terminals works fine, but loading of nouveau for Xorg fails. Maybe so=
meone can help me or give me hints (what do I have to change?). The kernel =
produces the attached output.
>
> Best regards,
> =A0 Lars Callenbach

You can't use nvidiafb and nouveau at the same time. Get rid of
nvidiafb, nouveau can provide a framebuffer console on it's own. The
wiki should have this info in the installation section.
