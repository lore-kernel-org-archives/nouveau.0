From: "Louise Hoffman" <louise.hoffman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Does Nouveau break the nVidia drivers?
Date: Thu, 12 Jul 2007 19:48:53 +0200
Message-ID: <30c82f5f0707121048o4453a2b6n57e752468ef7a2d2@mail.gmail.com>
References: <30c82f5f0707120641v45a01c72yb3a828271d1d64f9@mail.gmail.com>
	<46965347.20005@sms.ed.ac.uk>
	<30c82f5f0707121009o55e1c4dfo6c5a4cc4d7db51da@mail.gmail.com>
	<469668BB.8030003@sms.ed.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <469668BB.8030003-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
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
To: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Section "DRI"
>        mode 666
> EndSection
>
> and by 'loading' the glx and dri modules, I mean add these two in the
> 'Section "Module"' of your xorg.conf:
> Load   "glx"
> Load   "dri"

Thanks =)

> As Richard said, it's a much more daunting task if you need the latest
> nouveau drivers. And frankly, if you want to test anything useful, you
> will need the new ones, since those that come with fedora are pretty old
> and incomplete. They are missing the DRI part (nouveau_dri.so, part of
> Mesa).

So I can't try send dumps to Nouveau without breaking livna nVidia drivers? =(
