From: Mikhail Ramendik <mr-eJ/51bLfIl8ox3rIn2DAYQ@public.gmane.org>
Subject: Re: "Decode videos"
Date: Fri, 17 Dec 2010 01:46:27 +0000
Message-ID: <AANLkTik=YaHaixeJWmwJTH-vPyyzrwtn3DeY7O767Oi=@mail.gmail.com>
References: <AANLkTimLWGd5Qp8ARTUy5ru8Uwm_H2=B-0nCAys4yK3W@mail.gmail.com>
	<AANLkTikufPCJWBMJt2A6yRzA9q2bH-x9zf4KJ6+WySHB@mail.gmail.com>
	<20101206200707.4793a30a@amd64linuxmsi.rentzhouse.lan>
	<AANLkTikOvVZhzXqFOtBvDhudcP=SL__YvBoRHbY__V1d@mail.gmail.com>
	<AANLkTimxkpQKHdg5G2ZY-97_4P4XAZ+UobZHFNF7ZqOf@mail.gmail.com>
	<20101216201011.156e62ab@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101216201011.156e62ab-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, James Courtier-Dutton <james.dutton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 17 December 2010 01:10, Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> It would be nice for H.264 to be supported in nouveau. =A0The
> problem is that someone would have to write a shader to perform
> the mb/idct stage. =A0I guess it is doable, but I imagine that some gpus
> will have trouble running the shaders without slowing down too
> much. =A0However, it is unrealistic to think (for me) that someone will be
> trying to watch a H.264 blu-ray on an NV30/NV40.
> The ideal H.264 solution is to have full hw offload for >=3D NV50 cards
> using the decode hw. =A0That could take some time since the hw
> microcode/programs will need to be re if I remember correctly.

Well, h.264 is not just used in Blu Ray. There are satellite HD
programs and recordings of such. I have some (on UK Freesat), and I
have an NV44.

In my particular case, I got the NV44 in late 2006 because it had no
fan (I wanted a quiet system) and it gave a DVI output to my AGP
motherboard. Upgrading that would mean replacing the motherboard (to
get PCIx), that means replacing the RAM... and all that to see HD sat?

Or should I just forget acceleration and try to tweak the decoder -
currently the xine engine in kaffeine - to do HD sat in CPU? It's a 3
GHz P4 so it might do it, especially since the bitrate is not that
high and no scaling is required? I could do with 720p if I knew how to
decode that from a "full HD" stream.

-- =

Yours, Mikhail Ramendik

Unless explicitly stated, all opinions in my mail are my own and do
not reflect the views of any organization
