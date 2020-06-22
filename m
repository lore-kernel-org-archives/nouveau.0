From: Jeroen Diederen <jjhdiederen-RSh1/+X/PmFmR6Xm/wNWPw@public.gmane.org>
Subject: Re: nouveau on G5 Macs
Date: Mon, 22 Jun 2020 18:08:38 +0200
Message-ID: <45fa1029cf5f0610e4a3e1d65bb26b32@zonnet.nl>
References: <abb79c7114a58cf5b31542009531897c@zonnet.nl>
 <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvidTyx6+yQbJ-sy=yh9YqrMQ0=gh6a0WHmqS94VvZSUPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Ilia,

I experience screen tearing for both 64k and 4k page size.
My iMac G5 has an nVidia Geforce FX 5200 Ultra GPU.

Regards,
Jeroen

  Ilia Mirkin schreef op 2020-06-22 17:25:
> Which GPU do you have? The NV40 AGP board (GeForce 6800) works
> particularly poorly. However as long as you go with 4k pages (and
> there's no real benefit to 64k pages for most applications), basic
> things should work. I wouldn't recommend using a GL-based compositor
> though.
> 
> Which distortion are you talking about?
> 
> Cheers,
> 
>   -ilia
> 
> On Mon, Jun 22, 2020 at 11:10 AM Jeroen Diederen 
> <jjhdiederen-RSh1/+X/PmFmR6Xm/wNWPw@public.gmane.org> wrote:
>> 
>> Hi all,
>> 
>> I have been trying to solve nouveau issues on my iMac G5 for ages. As
>> far as I can understand it, there is a problem with nouveau and page
>> size mapping. I tried both 64K and 4K page size kernels and the the
>> result is always distorted video.
>> There is an old To-Do list, which says "fix the page size mapping
>> problem on G5/64 bit for exposing fifo regs" on
>> https://nouveau.freedesktop.org/wiki/ToDo/.
>> 
>> Is there any chance that this bug will be fixed ? I am not a 
>> programmer,
>> so I can't be of any help.
>> 
>> Jeroen Diederen
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
