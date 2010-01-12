From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: reserve_ram_pages_type failed
Date: Tue, 12 Jan 2010 01:10:37 +0100
Message-ID: <91752841001111610q78af5515g73725e3c4aa56e67@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Jan 11, 2010 at 10:13 AM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> [ =A0268.666662] reserve_ram_pages_type failed 0x9cba000-0x9cbb000,
> track 0x8, req 0x10
> [ =A0269.001031] reserve_ram_pages_type failed 0x6ff0000-0x6ff1000,
> track 0x8, req 0x10
> [ =A0269.474134] reserve_ram_pages_type failed 0x68f2000-0x68f3000,
> track 0x8, req 0x10
> [ =A0269.767270] reserve_ram_pages_type failed 0x14c98000-0x14c99000,
> track 0x8, req 0x10
> [ =A0269.783213] reserve_ram_pages_type failed 0x23eb000-0x23ec000,
> track 0x8, req 0x10
> [ =A0270.161672] reserve_ram_pages_type failed 0x10784000-0x10785000,
> track 0x8, req 0x10
> [ =A0270.376144] reserve_ram_pages_type failed 0x9e01000-0x9e02000,
> track 0x8, req 0x10
> [ =A0271.169852] reserve_ram_pages_type failed 0xe1b7000-0xe1b8000,
> track 0x8, req 0x10
> [ =A0271.607980] reserve_ram_pages_type failed 0x3ae2000-0x3ae3000,
> track 0x8, req 0x10
> [ =A0272.027030] reserve_ram_pages_type failed 0x195e8000-0x195e9000,
> track 0x8, req 0x10
> [ =A0284.930170] reserve_ram_pages_type failed 0xdcd4000-0xdcd5000,
> track 0x8, req 0x10
> [ =A0285.043614] reserve_ram_pages_type failed 0x36c5000-0x36c6000,
> track 0x8, req 0x10
> [ =A0285.941944] reserve_ram_pages_type failed 0x30d2000-0x30d3000,
> track 0x8, req 0x10
> [ =A0341.055291] reserve_ram_pages_type failed 0x1b90b000-0x1b90c000,
> track 0x8, req 0x10
> [ =A0355.005349] [drm] nouveau 0000:03:00.0: nouveau_channel_free: freein=
g fifo 2
> [ =A0355.074031] etracer used greatest stack depth: 5632 bytes left
>

Using a more recent nv25 classic mesa, I get no crash/bug, no validate
-12,  but I still get all the reserve_ram_pages_type errors. They
always come up on every new level started in etracer.
So the game will run at 0fps for 10-30 seconds displaying >10
reserve_ram_pages_type failed errors, and then it will run fine.

Maarten seemed to say these errors were a big deal, so I thought I
would share my new way to generate a lot of them.

I would be curious to know the link between this scenario and the
"loading big picture in firefox one" that goes like this :
two "validate: -12" + one "reserve_ram_pages_type failed"
