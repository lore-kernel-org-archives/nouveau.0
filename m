From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: rendering problems with latest ddx driver (nv50)
Date: Tue, 24 Apr 2012 20:49:45 +0200
Message-ID: <CAGZ4FERhLZdXm51i4wbDxNNjU1g3SP6uX6399eKtR7LRWO_PQw@mail.gmail.com>
References: <CAGZ4FETeOjfQD5DV1+=sx4NCk9xuMrvQhH1fS-TrmoVRiMc7mQ@mail.gmail.com>
	<4F96F2C8.900@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4F96F2C8.900-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Apr 24, 2012 at 8:36 PM, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:
> Le 24/04/2012 20:14, Maarten Maathuis a =E9crit :
>
>> Do you get rendering errors also when using a nv50 class gpu? I seem
>> to get them in firefox.
>>
>> I also noticed a huge amount of failures when running rendercheck -t
>> gradients, which i find odd, because they are not supposed to be
>> accelerated.
>
> Hi,
>
> By any chance, are you using cairo 1.12? If so, try downgrading to cairo
> 1.10.
>
> Martin

No, i'm using cairo 1.10.2. Also rendercheck isn't affected by cairo.
The last driver upgrade included at least the migration to the new
libdrm and everything that came after it. That's when the rendering
corruption started.

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
