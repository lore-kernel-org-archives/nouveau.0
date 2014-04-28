From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Missing menus in windows after update
Date: Sun, 27 Apr 2014 23:01:57 -0400
Message-ID: <CAKb7UviNU=H=G2UarrW1FBZsHfcN2C4rePq290SEhkOKkwKWpg@mail.gmail.com>
References: <20140427194139.5a9d3594@Devil-Bonobo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140427194139.5a9d3594@Devil-Bonobo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Apr 27, 2014 at 10:41 PM, John Jason Jordan <johnxj-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
> Ubuntu 13.10 x86_64 up to date on laptop with nVidia GeForce GTX 765M.
>
> There were some updates that I applied last week, and ever since I have
> missing text in some menus and lists. It is especially bad in Claws Mail
> and LibreOffice Writer. However, text appears correctly; it's just the
> menus where the text has disappeared. For example, when writing in LO
> Writer the part of the window where the typed text appears is fine; but
> the menus along the top have just --- instead of the word (File, Edit,
> etc.), and if I click on one of the --- the drop-down shows only a --
> to the left of the item. None of the style names appear in the styles
> toolbar, nor does the name of the font that is in use.
>
> After the update I have:
>
>         libdrm-nouveau2 2.4.46-1-ubuntu1
>         xserver-xorg-video-nouveau 1:1.0.9-2ubuntu1
>
> This computer has never had the nVidia proprietary drivers installed.
> Nor have I ever tried to use the extra features (bumblebee, etc.). There
> are no error messages in Xorg.0.log.
>
> I could use some suggestions for where to look to fix this, or how to
> file a bug report.

Did this work fine before? If so, when was before?

What kernel version are you using? What mesa version do you have installed?

Is this an optimus laptop? If so, do you have the intel card enabled
in the BIOS, or is it set to nvidia-only? In that case, unless you've
specifically set up GPU offloading, your issues would be with the
intel driver.

Can you provide your dmesg + Xorg log? That will answer some of the
above questions.

Are you using a compositor? If so, what happens if you turn it off (or
tell it not to use OpenGL, if that's an option).

  -ilia
