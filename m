From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv40 mpeg2 video decode
Date: Fri, 15 Jan 2010 00:11:24 -0500
Message-ID: <586c2acd1001142111g136f01cbtea9bd268a46526f4@mail.gmail.com>
References: <20100112220256.18149b3e@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100112220256.18149b3e-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Jan 12, 2010 at 10:02 PM, Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> I have been working on a kernel and a user layer for the nv40 mpeg2 video=
 decoding hardware:
> * The decode hw accepts commands written to a fifo along with a set of re=
gisters for firing (put) and queries (get).
> * The fifo can be mapped in vram or agp (though, agp isn't working right =
now).
> * The fifo does not support dma jumps and such like the 3d fifo.
>
> Well, I have some questions about how to implement this in nouveau:
>
> * Mapping decode fifo in user-space versus kernel-space - My current vers=
ion has the fifo being mapped from the kernel (I copied the 3d fifo simple =
version pretty much). =A0I could do this in the kernel or userspace but it =
would probably be faster in the kernel.

If it's faster in kernel that would probably be best.

> * Fencing - Each decode cmd sequence can emit a fence in a similar fashio=
n to the 3d fifo. =A0So, you set the fence sequence number after a set of c=
mds. =A0You then check a register to see when the hw is done with a set of =
cmds. =A0I just don't see an easy of implementing this since the current fe=
nce mechanism only works for the 3d fifo.

We don't do anything for userspace fencing anymore so whatever you do
in the kernel doesn't need to reach gallium yet. It can always be
cleaned up later. Although I forgot to ask, how does the blob handle
XvMCPutSurface? If it uses pfifo/pgraph to do CSC we would need the
fencing to be accessible in gallium to coordinate that.
