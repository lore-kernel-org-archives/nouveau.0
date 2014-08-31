From: Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH envytools] nvamemtiming: Handle target <
 initial case when iterating values
Date: Sun, 31 Aug 2014 16:01:23 +0200
Message-ID: <54032AB3.3000508@gmail.com>
References: <1409490042-8725-1-git-send-email-titan.costa@gmail.com>
 <1409490042-8725-4-git-send-email-titan.costa@gmail.com>
 <54031F56.4070906@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54031F56.4070906-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 31/08/2014 15:12, Martin Peres a =E9crit :
> On 31/08/2014 15:00, Christian Costa wrote:
>> Otherwise some values are not tested at all.
> I would rather have a warning than the program doing stuff behind my =

> back. This is a dev tool, dumb =3D=3D good ;)
>
But why didn't you call it Dumb mode rather that Deep mode. That way, I =

wouldn't have tried to use it and figure out what it does. ;p

So about my problem,

Command:
sudo nvamemtiming pramin 0x6a22 3 0 -d 5

Vbios info:
Table offset at 0x6a22
Entry 3 =3D> 0x6a73: 0d 06 0f 26 00 45 00 1b 00 0b 0d 08 04 0c 01 00 00 00 =

03 03 10 0a 09 00 03
Entry 5 =3D> 0x6aa5: 05 04 08 05 00 09 00 03 00 02 02 02 02 0c 02 00 00 00 =

03 03 08 0a 0f 00 02

With the current code, I get these iterations:
timing table at: 6a22
Deep mode: Will iterate between 5 and 24
idx 5, initial 45, target 9
idx 7, initial 1b, target 3
idx 9, initial b, target 2
idx 10, initial d, target 2
idx 11, initial 8, target 2
idx 12, initial 4, target 2
idx 13, initial c, target c
idx 18, initial 3, target 3
idx 19, initial 3, target 3
idx 20, initial 10, target 8
idx 21, initial a, target a
idx 22, initial 9, target f =3D> a b c d e f
idx 24, initial 3, target 2

It does not test much for the reason most of the time the target value =

is lower than the initial one.

With my patch:
timing table at: 6a22
Deep mode: Will iterate between 5 and 24
idx 5, initial 45, target 9 =3D> 44 43 42 41 40 3f 3e 3d 3c 3b 3a 39 38 37 =

36 35 34 33 32 31 30 2f 2e 2d 2c 2b 2a 29 28 27 26 25 24 23 22 21 20 1f =

1e 1d 1c 1b 1a 19 18 17 16 15 14 13 12 11 10 f e d c b a 9
idx 7, initial 1b, target 3 =3D> 1a 19 18 17 16 15 14 13 12 11 10 f e d c =

b a 9 8 7 6 5 4 3
idx 9, initial b, target 2 =3D> a 9 8 7 6 5 4 3 2
idx 10, initial d, target 2 =3D> c b a 9 8 7 6 5 4 3 2
idx 11, initial 8, target 2 =3D> 7 6 5 4 3 2
idx 12, initial 4, target 2 =3D> 3 2
idx 13, initial c, target c
idx 18, initial 3, target 3
idx 19, initial 3, target 3
idx 20, initial 10, target 8 =3D> f e d c b a 9 8
idx 21, initial a, target a
idx 22, initial 9, target f =3D> a b c d e f
idx 24, initial 3, target 2 =3D>2

Maybe shallow mode would be enough to test timing but what the purpose =

of deep mode in that case ?

Christian
