From: Mikhail Ramendik <mr-eJ/51bLfIl8ox3rIn2DAYQ@public.gmane.org>
Subject: Re: "Decode videos"
Date: Thu, 16 Dec 2010 19:28:47 +0000
Message-ID: <AANLkTikOvVZhzXqFOtBvDhudcP=SL__YvBoRHbY__V1d@mail.gmail.com>
References: <AANLkTimLWGd5Qp8ARTUy5ru8Uwm_H2=B-0nCAys4yK3W@mail.gmail.com>
	<AANLkTikufPCJWBMJt2A6yRzA9q2bH-x9zf4KJ6+WySHB@mail.gmail.com>
	<20101206200707.4793a30a@amd64linuxmsi.rentzhouse.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101206200707.4793a30a-bEIzoA7YQWm4miubQJdzGGS2/mPcPMSI/gJWpUujD0o@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 7 December 2010 01:07, Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Initially I would say XVMC. =A0VDPAU expects full hw bitstream
> decode. =A0XVMC only does decode starting at idct/mb. =A0I am guessing it
> is possible to support VDPAU by doing the earlier stages in software
> then handling the reset to hw. =A0Well, unless someone figures out some
> way to handle the full pipeline in hw via shaders which is something
> I have no time or knowledge.

Just had an idea - perhaps VAAPI would be easier to support than VDPAU?

The main thing would probably be h264, as that is the only format
which some modern CPUs are not strong enough to decode.


-- =

Yours, Mikhail Ramendik

Unless explicitly stated, all opinions in my mail are my own and do
not reflect the views of any organization
