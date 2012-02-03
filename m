From: =?ISO-8859-1?Q?Viktor_Novotn=FD?= <noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/i2c: Fix i2c initialization on
 cards with DCB older than 1.5
Date: Fri, 03 Feb 2012 23:58:04 +0100
Message-ID: <4F2C667C.5030003@seznam.cz>
References: <4F16C909.4050503@seznam.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4F16C909.4050503-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,
did anybody find time to look into this issue? By the way, I think it was i=
ntroduced by commit 486a45c2.

Regards
	Viktor

On 18.1.2012 14:28, Viktor Novotn=FD wrote:
> Signed-off-by: Viktor Novotny<noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
> ---
> Hi,
> I think I found a bug - my NV11 fails to init i2c ports and is then unabl=
e to read EDID.
> It's because while i2c_table in nouveau_i2c.c:324 returns null for this c=
ard,
> i2c is initialized anyway at line 341 and wrong i2c table format is then =
selected at line 350.
> This patch fixes the problem on NV11 and was tested also on NV25. I hope =
no cards but those
> with legacy i2c table have i2c table version set to 0.
> =
