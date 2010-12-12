From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50 channel takedown
Date: Sun, 12 Dec 2010 14:35:53 +0100
Message-ID: <AANLkTikTSkbz-zq3QRbRxxKV5JhxUR01f0fJVzsrpWu-@mail.gmail.com>
References: <AANLkTimCGns+nKEb90yr+KUNf=d0W0A_5eA-Rnzq682s@mail.gmail.com>
	<AANLkTimKjp-o725yjjOutrtbc4SNEyKRRuUKe2XbTNja@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimKjp-o725yjjOutrtbc4SNEyKRRuUKe2XbTNja-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Dec 12, 2010 at 2:28 PM, Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> For some reason this
> (http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=114432fd006141fa74fb67b2256b2d1dac617d9f)
> comes to mind, not that it matches the error exactly, but still,
> consider trying a kernel that includes this commit.
>

There were many changes after the commits I mentioned, but latest git
has the same problem. Very easy to trigger the issue.

If no one else has the problem, I am wondering if it could be some
hardware issue. It is a laptop with a standard nv84, which never had
any exotic behavior before.
