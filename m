From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] nv50: initial bits for "shadowfb"
Date: Fri, 13 Feb 2009 00:22:33 +0100
Message-ID: <6d4bc9fc0902121522w4e6ba6d4vf42e16e1d80f42f8@mail.gmail.com>
References: <1234479392-1984-1-git-send-email-madman2003@gmail.com>
	<1234479392-1984-2-git-send-email-madman2003@gmail.com>
	<6a89f9d50902121511w2b20af44m48b9c48d2fc97175@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50902121511w2b20af44m48b9c48d2fc97175-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Feb 13, 2009 at 12:11 AM, Stephane Marchesin
<marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org> wrote:
> On Thu, Feb 12, 2009 at 23:56, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> - Fallbacks on the frontbuffer still need to be handled.
>> ---
>
> Why are you posting this again ? It's not really better than the last
> time, still a lousy workaround.
>
> Stephane
>

It's at least correct rendering wise (the last one obviously wasn't).
I was curious about how difficult the implementation would be. I
wanted to put the issue on the table. The hw "fix" is out my reach,
but if anyone wants to give it a shot then be my guest. These patches
are also serve the bridge the gap between now and the moment exa wfb
support becomes reasonable widespread, regardless of hw issues.

Maarten.
