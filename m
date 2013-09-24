From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: offer to help, DCB
Date: Wed, 25 Sep 2013 05:43:46 +1000
Message-ID: <CAPM=9tykSx_p-SgK9+JpUADD8E_M6ciS5kXd68UaE-A9-sgiYg@mail.gmail.com>
References: <20130924044457.GA25785@parker.nvidia.com>
	<52413B42.9050101@canonical.com>
	<20130924181938.GD27823@parker.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20130924181938.GD27823-4K9zQNqW3/fFT5IIyIEb6QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

>> >
>> > NVIDIA is releasing public documentation on certain aspects of our GPUs,
>> > with the intent to address areas that impact the out-of-the-box usability
>> > of NVIDIA GPUs with Nouveau.  We intend to provide more documentation
>> > over time, and guidance in additional areas as we are able.
>> >
>> > As a first step towards that, we've posted a document here:
>> >
>> >     ftp://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
>> >
>> > that documents the Device Control Block ("DCB") layout in the VBIOS.
>> > The DCB describes board topology and the board's display connectors.
>> >
>> > I suspect much of the information in that document is not news for
>> > the Nouveau community, but hopefully it will be helpful to confirm your
>> > understanding or flesh out the implementation of a few unhandled cases.
>> >
>> > A few of us who work on NVIDIA's proprietary Linux GPU driver will pay
>> > attention to nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org and try to chime in when
>> > we can.
>> >
>> > If there are specific areas of documentation that would most help you, that
>> > feedback would help NVIDIA prioritize our documentation efforts.
>> >
>> > If you have specific questions for NVIDIA, you can ask here, or direct
>> > them to: open-gpu-doc-DDmLM1+adcqXj1p+fO2waQ@public.gmane.org
>
> Sorry, I got the email address wrong.  The right address is:
>
> gpu-public-documentation-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
>
> sorry I didn't double check the address before sending the announcement.
>
>> > I can't promise we'll be able to answer
>> > everything, but we'll provide best-effort in areas where we are able.
>> You rock! :D
>
> :)  Thanks, Maarten.
>
>> Our biggest struggle at the moment is the video clocking and power management, which is highly device specific
>> and depends on configuration too.
>
> Those will be two of the more difficult areas for us to address, but
> we'll see what can be done.
>
>> A complete video bios documentation would be nice too, I understand that will
>> take a bit longer than just the dcb. :)

Hey Andy,

this is great news,

I suppose the question I have is there any known upfront limits on
what you can release or is it going to be a per-request type thing?

My main request if you give Ben whatever he asks for :-P, but I'm
interested if you guys would be also able to say review things like
the microcode situation and say explaining what might be missing from
the nouveau microcode for context switching etc, along with VM things
like hw with pagefaults etc.

Dave.
