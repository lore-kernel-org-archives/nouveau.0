From: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix WITHIN macro off by one
Date: Sun, 20 Sep 2009 13:29:24 +0200
Message-ID: <6a89f9d50909200429u234af84l84e4c1eb6e24b287@mail.gmail.com>
References: <1253297727-8126-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1253297727-8126-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Sep 18, 2009 at 20:15, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
> Equality in x <= y + z is already out of range. X must be stricly less.
>

Yeah, I did that back when the SIZE defines were, say, 0x1fff instead
of 0x2000 so this was required. Seems like the size defines changed,
but the WITHIN macro wasn't updated.

Stephane
