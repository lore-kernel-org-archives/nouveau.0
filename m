From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Wed, 17 Jun 2015 04:44:08 +0000
Message-ID: <bug-90887-8800-tiTqu7jnWX@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239494070=="
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


--===============1239494070==
Content-Type: multipart/alternative; boundary="1434516248.86a267E1.29442"; charset="UTF-8"


--1434516248.86a267E1.29442
Date: Wed, 17 Jun 2015 04:44:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jr from comment #4)
> I've been thinking a little about a better way to fix this inbound edge
> ordering dependency. Unfortunately it seems that unless there is a way to
> efficiently recompute the information there always will be an invariant that
> has to be respected by graph transformations (and which attach and detach
> simply cannot guarantee on their own).

The way that LLVM deals with this is that the source actually contains a
reference to the inbound bb as well. That way you can do whatever you want with
the edges, each src of a phi node knows which bb it's coming from.

It'd be a bit of a pain to introduce here... my strategy so far has been to
hold my nose and just fix things up as they come, which I guess is what you've
done as well. I need to look at this logic very carefully though.

The fact that we were previously adding a FORWARD edge and aren't anymore is a
bit worrying -- the meaning of those things is explained somewhere btw -- TREE
== part of the MST; FORWARD/etc are various other edges.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434516248.86a267E1.29442
Date: Wed, 17 Jun 2015 04:44:08 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c4">comment #4</a>)
<span class="quote">&gt; I've been thinking a little about a better way to fix this inbound edge
&gt; ordering dependency. Unfortunately it seems that unless there is a way to
&gt; efficiently recompute the information there always will be an invariant that
&gt; has to be respected by graph transformations (and which attach and detach
&gt; simply cannot guarantee on their own).</span >

The way that LLVM deals with this is that the source actually contains a
reference to the inbound bb as well. That way you can do whatever you want with
the edges, each src of a phi node knows which bb it's coming from.

It'd be a bit of a pain to introduce here... my strategy so far has been to
hold my nose and just fix things up as they come, which I guess is what you've
done as well. I need to look at this logic very carefully though.

The fact that we were previously adding a FORWARD edge and aren't anymore is a
bit worrying -- the meaning of those things is explained somewhere btw -- TREE
== part of the MST; FORWARD/etc are various other edges.</pre>
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

--1434516248.86a267E1.29442--

--===============1239494070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1239494070==--
