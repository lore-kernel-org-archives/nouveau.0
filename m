From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Fri, 8 Jan 2010 01:50:11 +0100
Message-ID: <91752841001071650t4a9ecb3cm5c922105a668771a@mail.gmail.com>
References: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
	<6d4bc9fc0912111604oca0be3dm7f001bb05e85084@mail.gmail.com>
	<6d4bc9fc0912121350x54cde8b5yf72552c2d89ca2ab@mail.gmail.com>
	<91752840912131235v7e2a289ap32e92ef95574ce8b@mail.gmail.com>
	<91752841001071551i22069238of23551dc4b67cf39@mail.gmail.com>
	<1262909650.7007.1.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262909650.7007.1.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 8, 2010 at 1:14 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, 2010-01-08 at 00:51 +0100, Xavier wrote:
>> On Sun, Dec 13, 2009 at 9:35 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Sat, Dec 12, 2009 at 10:50 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >>
>> >> Can you retry with the latest ddx?
>> >>
>> >> Maarten.
>> >>
>> >
>> > Awesome, it works, thanks ! :)
>> >
>>
>> I did not update that box for 3 weeks. I just did today (drm+ddx), and
>> it has regressed.
> Can you update your libdrm too please, the fix was moved to there and
> reverted in the DDX.
>

Strange, I am 99% sure I did update libdrm , and before updating ddx.
I will double-check tomorrow.

And I indeed found this commit :
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=bb1947831d9a4e080b8d1e9dba086af6527ef479
So I assume the libdrm one is this one on the same day :
http://cgit.freedesktop.org/mesa/drm/commit/?id=f1660c249198b5cc14ebbb75107da7bcb6972033

So by playing with these two commits, I should also be able to provide
more information. Thanks !
