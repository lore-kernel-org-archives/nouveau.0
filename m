From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Mon, 29 Jun 2015 23:06:35 +0000
Message-ID: <bug-90887-8800-VF0nztO5j1@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0665116170=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0665116170==
Content-Type: multipart/alternative; boundary="1435619195.dF2E3.15597"; charset="UTF-8"


--1435619195.dF2E3.15597
Date: Mon, 29 Jun 2015 23:06:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jr from comment #19)
> I do prefer the map based approach over this last attempt. Keeping track of
> the relevant BB is quite obviously correct, but trying to keep track of edge
> reordering instead looks like some kind of thimbleriggery to me:-)
> 
> AFAICT the separate loop added by commit e43a3a66 was an attempt to fix the
> problem. Attach() and detach() influenced the iterator ei of the loop,
> possibly creating crashes or endless loops. These symptoms are corrected by
> the patch, but the real problem - reordering of the edge linked list - is
> still not accounted for. Your patch shows how to do that correctly.
> 
> Since my attempt doesn't change the incoming edge list, the separate loop
> becomes obsolete as a bonus feature. I do like that property, but I don't
> think it makes much of a difference in practice (since the lists in question
> are very short).

Yeah, I'm less keen on that last approach. Esp since it basically can't work :)

There are a bunch of other situations where I'd *like* to be able to do BB
rejiggers, so doing something generic is nice. I'm warming up to your patch.
The only problem is that I've never been able to wrap my head around the way
that the graph is stored, with the next/prev arrays which point to... who
knows. Seems like a hand-rolled doubly-linked list. But just very confusing.
But in the end the graph reparenting of edges may be the way to go here.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435619195.dF2E3.15597
Date: Mon, 29 Jun 2015 23:06:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c19">comment #19</a>)
<span class="quote">&gt; I do prefer the map based approach over this last attempt. Keeping track of
&gt; the relevant BB is quite obviously correct, but trying to keep track of edge
&gt; reordering instead looks like some kind of thimbleriggery to me:-)
&gt; 
&gt; AFAICT the separate loop added by commit e43a3a66 was an attempt to fix the
&gt; problem. Attach() and detach() influenced the iterator ei of the loop,
&gt; possibly creating crashes or endless loops. These symptoms are corrected by
&gt; the patch, but the real problem - reordering of the edge linked list - is
&gt; still not accounted for. Your patch shows how to do that correctly.
&gt; 
&gt; Since my attempt doesn't change the incoming edge list, the separate loop
&gt; becomes obsolete as a bonus feature. I do like that property, but I don't
&gt; think it makes much of a difference in practice (since the lists in question
&gt; are very short).</span >

Yeah, I'm less keen on that last approach. Esp since it basically can't work :)

There are a bunch of other situations where I'd *like* to be able to do BB
rejiggers, so doing something generic is nice. I'm warming up to your patch.
The only problem is that I've never been able to wrap my head around the way
that the graph is stored, with the next/prev arrays which point to... who
knows. Seems like a hand-rolled doubly-linked list. But just very confusing.
But in the end the graph reparenting of edges may be the way to go here.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435619195.dF2E3.15597--

--===============0665116170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0665116170==--
