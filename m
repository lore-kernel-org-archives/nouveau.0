From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50 piglit regression
Date: Fri, 30 Apr 2010 15:36:06 +0200
Message-ID: <h2vb67489df1004300636p76567b0aic7a502979c5f09a5@mail.gmail.com>
References: <o2wb67489df1004290543sb9ea19e8m241e293960d4c163@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <o2wb67489df1004290543sb9ea19e8m241e293960d4c163-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Thu, Apr 29, 2010 at 2:43 PM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Between mesa-7.8.1-1697-g1820d24 and mesa-7.8.1-1911-g7327a84 , I got
> 4 new failures :
> general/texgen
> glean/polygonOffset
> shaders/fp-generic/ dph and kil-swizzle
>
> If some of these are not already known and expected, I will do a bisect.
>

Sorry it is apparently not a mesa regression. Downgrading mesa does not help.
In the same time, I did a distrib upgrade that bumped xorg server from
1.7.6 to 1.8.0.901
Downgrading just xorg-server fixes the 4 tests above.
