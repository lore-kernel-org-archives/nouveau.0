From: =?windows-1252?Q?Nicolas_G=F6ddel?= <mailinglists-WO/VGsxbqFypxiQzEpw4SQ@public.gmane.org>
Subject: Re: Artifacts on external monitor with Optimus and GK107
 on Thinkpad W530
Date: Tue, 29 Apr 2014 21:10:36 +0200
Message-ID: <535FF92C.7090508@freakscorner.de>
References: <535FBAFD.2010300@freakscorner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <535FBAFD.2010300-WO/VGsxbqFypxiQzEpw4SQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

as additional information here a youtube video showing the problem after cl=
osing
a vlc window:

https://www.youtube.com/watch?v=3D-GWaEo-pEGs

Am 29.04.2014 16:45, schrieb Nicolas G=F6ddel:
> Hi there,
>
> last week I installed Ubuntu Gnome 14.04 on my Thinkpad W530. It has the
> following specifications:
>
> Intel Core i7-3820QM
> Intel HD 4000 and nVidia Quadro K2000M
> 15,6" FHD RGB 1920x1080
>
> With "Optimus" enabled in the BIOS, I am able to use the external monitor=
 via
> VGA-1-2. But there are refresh problems only on the external monitor: Mou=
se
> traces, parts of a window remain on the screen after closing the window, =
etc. My
> idea was to enable VSync for the external monitor but I don't know how to=
 enable
> this. If you say enabling VSync will not help, maybe you have an other id=
ea to
> avoid these refresh problems?
>
> This is what 'glxgears' outputs (First 8 lines the glxgears window was on=
 the
> external screen, last 3 lines the window was on the internal screen):
>
> nicolas@tp-w530:~$ glxgears
> Running synchronized to the vertical refresh. The framerate should be
> approximately the same as the monitor refresh rate.
> 14814 frames in 5.0 seconds =3D 2962.673 FPS
> 16443 frames in 5.0 seconds =3D 3288.454 FPS
> 15912 frames in 5.0 seconds =3D 3182.394 FPS
> 14498 frames in 5.0 seconds =3D 2898.920 FPS
> 13834 frames in 5.0 seconds =3D 2766.738 FPS
> 14584 frames in 5.0 seconds =3D 2916.712 FPS
> 14802 frames in 5.0 seconds =3D 2960.245 FPS
> 11026 frames in 5.0 seconds =3D 2205.070 FPS
> 299 frames in 5.0 seconds =3D 59.675 FPS
> 299 frames in 5.0 seconds =3D 59.680 FPS
> 299 frames in 5.0 seconds =3D 59.676 FPS
>
> This is how I tested VSync.
>
> Best Regards,
> Nicolas
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>


-- =

=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=
=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97=97
Homepage: http://freakscorner.de
Facebook: http://www.facebook.com/Bastelkeller
Twitter: http://twitter.com/freaks_corner
