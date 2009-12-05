From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] nouveau: add ratelimit to
 nouveau_graph_dump_trap_info
Date: Sat, 5 Dec 2009 18:49:33 +0200
Message-ID: <20091205184933.0193575d@daedalus.pq.iki.fi>
References: <1259357794-6972-1-git-send-email-shiningxc@gmail.com>
	<1259361073-24931-1-git-send-email-shiningxc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1259361073-24931-1-git-send-email-shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 27 Nov 2009 23:31:13 +0100
Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Often when things get stuck spinning, nouveau_pgraph_intr_error
> and nouveau_graph_dump_trap_info gets called many times, flooding
> logs with PGRAPH_ERROR and filling up the disk.
> 
> Pekka Paalanen pointed me to ratelimit, so I went ahead and added
> some ratelimit support. It is much better now :)
> 
> I am completely new to the kernel world though so I hope I did
> not do something terribly wrong.
> 
> Signed-off-by: Xavier Chantry <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Pushed, finally, with a little message trimming.
Sorry for the delay.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
