From: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "userspace nouveau" on NV15
Date: Tue, 17 Sep 2013 04:34:06 +0400
Message-ID: <5237A37E.4080708@gmail.com>
References: <CALT56yNy42EHtpQK3Whk0tMAVyB-9B-4KNOJu+Sfsxu8V5rbBA@mail.gmail.com>
	<CACAvsv7ezdGcZTE0LBEz248_ARKKUDQ1TcXOz6vNUumghKU5oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7ezdGcZTE0LBEz248_ARKKUDQ1TcXOz6vNUumghKU5oQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/17/2013 04:21 AM, Ben Skeggs wrote:
> On Tue, Sep 17, 2013 at 10:04 AM, Dmitry Eremin-Solenikov
> <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello,
>>
>> I'm trying to get "userspace" nouveau to work on the NV15 card
>> (GeForce2 GTS - ASUS v7700 TVR).
>> Whilte kernel nouveau driver works, userspace nv_init programs hangs
>> during CONFIGURE_MEM.
> Does this help?
> http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=0c283c96aa58fa50d036662159d489dcba91d0bb

Yes, it works now. Thanks




-- 
With best wishes
Dmitry
