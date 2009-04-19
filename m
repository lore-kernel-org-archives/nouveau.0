From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV40 Cubic Texture HW Mip Map Generation
Date: Sat, 18 Apr 2009 21:13:23 -0400
Message-ID: <586c2acd0904181813s6703409eibbf19abe0b994842@mail.gmail.com>
References: <20090417015904.6c4b9d20@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090417015904.6c4b9d20-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: jb17bsome <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Apr 17, 2009 at 1:59 AM, jb17bsome <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
> Hello,
> =A0 =A0 =A0 =A0I have been looking at cubic texture mapping for a bit, an=
d I
> =A0 =A0 =A0 =A0have found that hw mipmap generation doesn't work at all or
> =A0 =A0 =A0 =A0the textures are all messed up (normal 2d work fine). This=
 is
> =A0 =A0 =A0 =A0with linear textures. =A0Also of note is that software mip=
map
> =A0 =A0 =A0 =A0generation works fine.
>
> =A0 =A0 =A0 =A0I have done sanity checks for the miptree pitches, offsets=
, etc
> =A0 =A0 =A0 =A0and everything seems to match up fine for both the hw and =
sw
> =A0 =A0 =A0 =A0paths.
>
> =A0 =A0 =A0 =A0Any thoughts on what could be wrong?
>
> jb17bsome

I was going to take a look, but apparently we don't have the cube_map
extensions hooked up, and I'm not sure how to do that with Mesa and
Gallium, and also there are no cube map tests in progs. Do you have a
patch and some test code? I don't know why it wouldn't work, cube maps
should work with the auto mipmap generation method they're using in
Mesa currently.
