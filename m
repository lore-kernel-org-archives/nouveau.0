From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Flickering Nvidia GeForce GT210
Date: Fri, 27 Dec 2019 08:50:35 -0500
Message-ID: <CAKb7UvhPJs1_0oEuj-W6N9gby9ntnoWNytaJ2RHKcaj-x7Q1zw@mail.gmail.com>
References: <BN6PR01MB233713E4E456F3C33AF3CAB9E32D0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7UvheYyPgSgkVXxd+U4tQdAA+Zq0hOv1nnmG7cHskA=vEfA@mail.gmail.com>
 <BN6PR01MB2337C1AC4B6AF0AA017057E1E32A0@BN6PR01MB2337.prod.exchangelabs.com>
 <CAKb7Uvi6zZX0y-0sOd2MqSye=ttF+Fb-GiFKsWH_PShOW2GjbA@mail.gmail.com>
 <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0@BN6PR01MB2337.prod.exchangelabs.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BN6PR01MB23371E2DF1A84D7FFBCF8993E32A0-ymtO2jJJLx+5jGy5ZsTgUV5F3wEVaoLpobIHt/V7iKVBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hm, this kind of "incomplete fill" flicker could be due to something
just not being able to keep up. But you may be in luck - nouveau may
support reclocking on your GPU -- check the contents
/sys/kernel/debug/dri/0/pstate for the various options, and echo e.g.
"0f" or "22" or whatever the desired level is listed as back into that
file (note - AC = "current", not an actual level).

On Fri, Dec 27, 2019 at 8:45 AM Jairo Quintanilla
<jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>
> The issue is like this.:
>
> https://youtu.be/4YQSL3xWrJA
>
> I have some tearing and sometimes flickering, just screen off and on suddenly in shorts periods of time.
>
> I have this problem with videos in YouTube using Firefox, and local videos using vlc and MPlayer for example.
>
>
> Enviado desde mi Samsung Mobile de Claro
>
>
>
> -------- Original message --------
> From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Date: 12/27/19 7:40 AM (GMT-06:00)
> To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
>
> And when you say "flickering", do you really mean some kind of
> decoding failure with blocks being off or whatever? Or maybe a frame
> ordering issue (where old frames appear instead of new ones
> sometimes)? Or just regular tearing?
>
> Is your video player using GL output, VDPAU output (and vdpau
> decoding), or Xv? (What video player are you using?)
>
> On Fri, Dec 27, 2019 at 8:33 AM Jairo Quintanilla
> <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > I'm using xorg and nouveau, not modesetting.
> >
> >
> > Thanks for your response.
> >
> >
> >
> > Enviado desde mi Samsung Mobile de Claro
> >
> >
> >
> > -------- Original message --------
> > From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> > Date: 12/27/19 7:31 AM (GMT-06:00)
> > To: Jairo Quintanilla <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
> > Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > Subject: Re: [Nouveau] Flickering Nvidia GeForce GT210
> >
> > Are you on Xorg or wayland of some sort? If on Xorg, which DDX are you
> > using -- nouveau or modesetting?
> >
> > On Fri, Dec 27, 2019 at 3:13 AM Jairo Quintanilla
> > <jairo_6875-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
> > >
> > > Hi mates,
> > >
> > > First to all thanks for your help.
> > >
> > > I've installed Nouveau driver for my Nvidia GeForce GT210 using Archlinux, but I have some flickering issues when playing videos, only in the video windows.
> > >
> > > Sometimes I can see some flickering when scrolling.
> > >
> > > Please help. I don't know how to fix it.
> > >
> > >
> > > Atte. Jairo Quintanilla
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau
