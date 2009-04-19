From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NV40 Cubic Texture HW Mip Map Generation
Date: Sat, 18 Apr 2009 23:27:50 -0400
Message-ID: <586c2acd0904182027j530590baod96761519d530996@mail.gmail.com>
References: <20090417015904.6c4b9d20@amd64linuxmsi.rentzhouse.lan>
	<586c2acd0904181813s6703409eibbf19abe0b994842@mail.gmail.com>
	<20090418212927.7a922c29@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090418212927.7a922c29-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
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

On Sat, Apr 18, 2009 at 9:29 PM, jb17bsome <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org> wrote:
> Try progs/demos/cubemap.c. =A0You just have to enable hw gen of
> mipmaps:

Ok I gave it a try, I get strange pink corruption on the sphere with
both gluBuildMipmaps and HW mipmap gen. It seems to happen around the
seems of the cube map faces and is related to the shading of the
individual tris that make up the sphere, since I can kind of see them
when they're pink. Is that what you're seeing too? Couldn't check what
the software renderer does because it brought down the server when I
ran the demo.

I would say that cubemap+mipmap rendering is broken, not specifically
HW mipmap gen, at least for me. No clue what the problem is though,
probably need to look at what the blob does.
