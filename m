From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Compiling REnouveau with Koala's script fails on
 Ubuntu Hardy
Date: Sat, 12 Apr 2008 14:30:30 +0300
Message-ID: <20080412143030.2ca2fc5f@daedalus.pq.iki.fi>
References: <196947f20804112133y68208107j7f5fd7a302cbb580@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <196947f20804112133y68208107j7f5fd7a302cbb580-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Whitehouse <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, 12 Apr 2008 16:33:30 +1200
"Aaron Whitehouse" <lists-U0r1Rbd8+dlZj6j52QthyaVXKuFTiq87@public.gmane.org> wrote:

> When I run the script, it runs fine and downloads the current CVS
> version. It then says:
> "Compiling renouveau failed. Choosing 'YES' will show you the log file
> of the compilation. 'NO' will abort. Please have a look at the trouble
> shoot section in our FAQ"
> 
> cc -g -Wall `sdl-config --cflags` re.o detection.o tests
> /usr/bin/ld: cannot find -lXvMCNVIDIA
> collect2: ld returned 1 exit status
> make: *** [renouveau] Error 1

This is a FAQ item:
http://nouveau.freedesktop.org/wiki/FAQ#head-e93d5298a66baa16293c8bc0be05c9f08b0140e8
"3.9. renouveau does not compile: cannot find -lXvMCNVIDIA"


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
