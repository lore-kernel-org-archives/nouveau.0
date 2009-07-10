From: Eric Valette <eric.valette-GANU6spQydw@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Fri, 10 Jul 2009 19:46:40 +0200
Message-ID: <4A577E80.4080109@free.fr>
References: <4A55DBDD.6030703@Free.fr>	<20090709193053.5a5d6430@daedalus.pq.iki.fi>	<4A5626F6.4090607@free.fr>	<20090709205154.4f613cc5@daedalus.pq.iki.fi>	<4A564A3B.1050905@free.fr>
	<BLU0-SMTP5459C57EAE328F89E4E6B5AE270@phx.gbl>
Reply-To: eric.valette-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BLU0-SMTP5459C57EAE328F89E4E6B5AE270-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sean Estabrooks <seanlkml-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

Sean Estabrooks wrote:
> On Thu, 09 Jul 2009 21:51:23 +0200
> Eric Valette <eric.valette-GANU6spQydw@public.gmane.org> wrote:
> 
>> The command
>> git clone git://anongit.freedesktop.org/git/mesa/mesa
>>
>> Does not work for me while others do. It hangs indefinitely (I let it
>> run once half a day, doing strace to see that I was waiting to a read on
>> a socket).
>>
>>> Also, I'd recommend studying git, you only ever have to 'clone' once.
>> If the full clone requires a day on 1Mbit sped, I guess you will have
>> few volunteers.
> 
> Eric,
> 
> Tried the clone of Mesa just now here and it took a little over 5 minutes
> to complete.  So, something is wrong for you locally or a server problem
> has been fixed since you last tried the clone.   Either way, this isn't
> a fundamental problem with Git.

Tried again today and indeed it worked. Server was probably restarted...

-- eric
