From: Albert Vilella <avilella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: SERIALIZE command
Date: Tue, 15 Jun 2010 13:17:50 +0100
Message-ID: <AANLkTilgUhL5VKW8Mz-hLnz0jzjKfGLW2hNUdYm1vefC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, cbergstrom-Hl0AACgZOF5l57MIdRCFDg@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi all,

Has anything changed since this email that will make OpenCL support in
nouveau easier?

I would like to compile some information about the different steps
needed to have OpenCL support for Nouveau (and the ATI open-source
drivers for that matters) so that people interested in this issue can
have a starting document to read.

Cheers,

Albert.

> Kernel allows you to create the relevant object, but other than that ther=
e's
> no support. You can indeed run your gpu code under nouveau if you're happy
> with writing it in nv50 machine code and submitting via the pushbuffer
> interface. Also our current memory managment is totally unfit for GPGPU
> applications and will need to be redone before there's any hope of seeing=
 CUDA
> or OpenCL support in nouveau.
>
> Also, if you have any more questions and don't hate IRC, you can come to
> #nouveau channel on freenode. Makes it easier to answer.
>
> > Thanks,
> > - Shinpei
>
> Marcin Ko=C5cielnicki
