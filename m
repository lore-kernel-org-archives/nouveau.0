From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Tue, 16 Jun 2015 11:28:57 +0000
Message-ID: <bug-90887-8800-DCfVqDZNMz@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1996418386=="
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


--===============1996418386==
Content-Type: multipart/alternative; boundary="1434454136.8743fBBF0.19067"; charset="UTF-8"


--1434454136.8743fBBF0.19067
Date: Tue, 16 Jun 2015 11:28:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #4 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
Thanks for reviewing and fixing the other patch! Meant to send it to the list,
but was too busy elsewhere last week.

I've been thinking a little about a better way to fix this inbound edge
ordering dependency. Unfortunately it seems that unless there is a way to
efficiently recompute the information there always will be an invariant that
has to be respected by graph transformations (and which attach and detach
simply cannot guarantee on their own).

And because the PhiMoves pass actually needs the corresponding inbound edge
instead of the BB the current encoding makes sense.

The conclusion being that neither the encoding of the information nor graph
transformations during SSA per se are the real problem. But attach and detach
are not the right tools to do graph transformations (at least during SSA). It
may be an improvement to add some more high level helpers, e.g. an Edge::split
for this particular problem. Would there be interest in a patch in that
direction? (Seems easy enough, but I cannot promise I'm up to the task,
though:-)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434454136.8743fBBF0.19067
Date: Tue, 16 Jun 2015 11:28:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>Thanks for reviewing and fixing the other patch! Meant to send it to the list,
but was too busy elsewhere last week.

I've been thinking a little about a better way to fix this inbound edge
ordering dependency. Unfortunately it seems that unless there is a way to
efficiently recompute the information there always will be an invariant that
has to be respected by graph transformations (and which attach and detach
simply cannot guarantee on their own).

And because the PhiMoves pass actually needs the corresponding inbound edge
instead of the BB the current encoding makes sense.

The conclusion being that neither the encoding of the information nor graph
transformations during SSA per se are the real problem. But attach and detach
are not the right tools to do graph transformations (at least during SSA). It
may be an improvement to add some more high level helpers, e.g. an Edge::split
for this particular problem. Would there be interest in a patch in that
direction? (Seems easy enough, but I cannot promise I'm up to the task,
though:-)</pre>
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

--1434454136.8743fBBF0.19067--

--===============1996418386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1996418386==--
