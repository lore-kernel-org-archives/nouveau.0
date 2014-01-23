From: =?ISO-8859-2?Q?Grzegorz_S=F3jka?= <gs-Ms+j0e0whA8@public.gmane.org>
Subject: Re: Quad head graphics card.
Date: Fri, 24 Jan 2014 00:24:42 +0100
Message-ID: <52E1A4BA.3040707@sojka.co>
References: <52E18EA4.6070708@mini.pw.edu.pl>	<52E19001.1020607@sojka.co>
	<CAKb7UvgT71qJaJNeHReL6YD12msC6KG9smTXU8tQYRPV4An=fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgT71qJaJNeHReL6YD12msC6KG9smTXU8tQYRPV4An=fw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 01/23/14 23:12, Ilia Mirkin wrote:
> On Thu, Jan 23, 2014 at 4:56 PM, Grzegorz S=F3jka <gs-Ms+j0e0whA8@public.gmane.org> wrote:
>> Hi there,
>>
>> I have 4 identical monitors. So I decided to buy (not to expensive,
>> around 100USD) quad head graphics card. I do not need anything
>> particular. Only office applications, no gaming. The crucial thing is
>> that I would like to be able to span a single window across all 4
>> monitors. I found following cards:
>> Nvidia Quadro NVS440
>> Nvidia Quadro NVS420
>> Both are actually dual GPU. Could you please confirm which one of these
>> cards may be configured as a single quad monitor DISPLAY using nouveau
>> driver? What about the binary nvidia driver?
>
> I would avoid those if possible. Both nouveau and the nvidia driver
> wil support them in a 4-monitor configuration, but there will be
> issues, esp with nouveau. Not sure about nvidia.
So, it would be possible to configure all 4 monitors as parts of one =

logical DISPLAY??
Just clarify: At the moment I use two dual head ATI FirePro 2270 =

graphics cards. As a consequence I have two logical (dual-monitors) =

DISPLAYS and the problem is that I'm not able to span a single window =

across more than 2 monitors.

> If possible, get a Kepler-based card, which can drive 4 CRTC's from 1
> GPU. That way you get none of the trouble.
What about: Gigabyte Radeon HD7770 OC?? I know, it's OT but maybe =

someone has experience.

-- =

Serdecznie pozdrawiam / Sincerely yours

Grzegorz S=F3jka
Faculty of Mathematics and Information Science
Warsaw University of Technology
ul. Koszykowa 75
00-662 Warsaw, POLAND
mob. +48 722 22 67 17
