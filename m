From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Video mode set failed: Couldn't find matching GLX
 visual
Date: Wed, 8 Jun 2011 19:50:58 +0300
Message-ID: <20110608195058.466e54b0@farn.lan>
References: <377581.30149.qm@web59311.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <377581.30149.qm-GA1rN4BTIjOB9c0Qi4KiSlZ8N9CAUha/QQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pop Horea <pop.horea-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 7 Jun 2011 05:05:23 -0700 (PDT)
Pop Horea <pop.horea-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:

> 01:00.0 VGA compatible controller: nVidia Corporation GT218
> [GeForce 310M] (rev a2) pophorea@pophorea-MS-168A:~$
> glmark2[ Fail ] - Video mode set failed: Couldn't find matching
> GLX visual glmark2
> 11.01=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> OpenGL Information=A0 =A0 GL_VENDOR: =A0 =A0 (null)=A0 =A0 GL_RENDERER:
> (null)=A0 =A0 GL_VERSION: =A0 =A0(null)
> =

> pophorea@pophorea-MS-168A:~$ glxinfo | grep renderingXlib:
> =A0extension "GLX" missing on display ":0.0".Xlib: =A0extension "GLX"
> missing on display ":0.0".Xlib: =A0extension "GLX" missing on
> display ":0.0".Xlib: =A0extension "GLX" missing on display
> ":0.0".Xlib: =A0extension "GLX" missing on display ":0.0".Error:
> couldn't find RGB GLX visual or fbconfigXlib: =A0extension "GLX"
> missing on display ":0.0".Xlib: =A0extension "GLX" missing on
> display ":0.0".Xlib: =A0extension "GLX" missing on display
> ":0.0".Xlib: =A0extension "GLX" missing on display ":0.0".Xlib:
> =A0extension "GLX" missing on display ":0.0".Xlib: =A0extension "GLX"
> missing on display ":0.0".

> Xlib: =A0extension "GLX" missing on display ":0.0".

That line is a pretty strong hint on what is broken.
Your X server is missing glx for some reason. Maybe
you failed to restore the original libglx.so when uninstalling
the Nvidia proprietary driver?

Please, attach the X log, if these hints are not enough.


Thanks.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
