From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: NV25 doesn't draw most icons
Date: Mon, 11 Aug 2014 17:06:36 -0400
Message-ID: <CAKb7UvjZd9RKiRvzcQY-hu4m7DzGJBwQb_uC23tSVoZe8UbDHw@mail.gmail.com>
References: <20140807083032.oo6ofuepycoosgk8-cebfxv@webmail.spamcop.net>
 <CAKb7UvgNsXcWh=cS=m-PxOYJvCyaVycXGHyETTsYU3vXdM8rWA@mail.gmail.com>
 <20140807154009.pqa40ggggcgsk040-cebfxv@webmail.spamcop.net>
 <CAKb7UvgsZ2nojG3_RMH-L_VguPy3G1j3h7VckxZPwH9XWCPMKg@mail.gmail.com>
 <20140811170113.twt77ow0ao8ocgsc-cebfxv@webmail.spamcop.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140811170113.twt77ow0ao8ocgsc-cebfxv-2RFepEojUI3Rd1RZctBqVdHuzzzSOjJt@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 11, 2014 at 5:01 PM, Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org> wrote:
> Quoting Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>:
>
>> http://lists.freedesktop.org/archives/nouveau/2014-August/018270.html
>> http://lists.freedesktop.org/archives/nouveau/2014-August/018271.html
>>
>> Please see if these help your issue.
>
>
> Thank you very much! I'll see that system in two weeks and I'll test it with
> your patches.

These are now in xf86-video-nouveau git, and a NV18 user reported that
they fixed similar-sounding problems. NV2x uses the same acceleration
logic as NV1x, although I couldn't test directly, since NV2x only
exist as AGP boards (except the Xbox... heh).

  -ilia
