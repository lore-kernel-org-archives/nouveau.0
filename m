From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nvidia says I have a 8200,
	but lspci says a GeForce 	9200M G
Date: Sun, 30 May 2010 18:32:41 -0400
Message-ID: <AANLkTilIFX3OelARW6o7osuRbInWscA4n2y4HnVQWFvH@mail.gmail.com>
References: <AANLkTilqRYN9lAFciH9JPUp4upw2wpzyxIOyweQkDOxd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilqRYN9lAFciH9JPUp4upw2wpzyxIOyweQkDOxd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Bryan Quigley <BryanQuigley-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, May 25, 2010 at 10:46 AM, Bryan Quigley <BryanQuigley-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> w=
rote:
> Hello all,
>
> I'm debugging a card that the Nvidia blob recognizes as an 8200 but
> lspci says is a GeForce 9200M G. =A0My original bug report is in
> launchpad.(https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-n=
ouveau/+bug/557895),
> but I have been trying to debug further by using the nightly builds.
> It still requires the noaccel flag to be set to work.
>
> I was wondering if there is anyway I could force it to be detected as
> a 8200 with nouveau. =A0I am guessing that it may be using some accel
> features of the 9200 and that's the reason it doesn't work. =A0PCI ID is
> 10de:086f

Don't pay attention to the marketing names, Nouveau is detecting your
card as an NVAC and that's all that matters. See your log:

[drm] nouveau 0000:02:00.0: Detected an NV50 generation card (0x0ac780b1)

Those chips are a little different from most other NV50s and not many
developers have access to them so there are probably still some issues
that need to be worked out.
