From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: (no subject)
Date: Sat, 13 Sep 2014 11:32:54 -0400
Message-ID: <CAKb7UvgnwZAUq1GMcNJBmSyH3Me2=ooKhDOPrgAes6TCbHMBHg@mail.gmail.com>
References: <20140913182452.45609099@marian1000.go.ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140913182452.45609099-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: asd <asd-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

What problem are you trying to solve? Perhaps you can start by
describing the symptoms, providing logs, etc?

On Sat, Sep 13, 2014 at 11:24 AM, asd <asd-jrA/B3VWHiL2D7C+UIOg5A@public.gmane.org> wrote:
> Hi
> On NV_40 on driver is sent instructions from NVE0 series
> not right
> I inspected register  9012c with nvtools
> and appear instructions to start unneeded engines
> NVE0_CHANNEL_IND_ENGINE_PPP
> NVE0_CHANNEL_IND_ENGINE_BSP
> NVE0_CHANNEL_IND_ENGINE_ENC
>
> I put one barrier but not start dri.
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
