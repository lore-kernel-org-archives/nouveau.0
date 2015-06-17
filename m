From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Wed, 17 Jun 2015 18:59:38 +0000
Message-ID: <bug-90887-8800-5ZrZ39JIGf@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139523473=="
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


--===============0139523473==
Content-Type: multipart/alternative; boundary="1434567578.52207C0.18119"; charset="UTF-8"


--1434567578.52207C0.18119
Date: Wed, 17 Jun 2015 18:59:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #8 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
Note that I really do have no clue of the whole system and only a very rough
understanding of SSA, but I think your result is the same as mine. The targets
of the newly inserted mov instructions are fine, because the PhiMoves pass
inserts them corresponding to mthe new phi sources, but the sources are
reversed, because the edges have been reordered (ironically by the PhiMoves
pass itself).

An edge newly attached using attach will always be the first in iteration
order. Therefore the problem happens as follows: when - as is the case here -
the second edge fulfills the needsNewElseBlock() condition it will be split to
insert the new BB for the copies. The old code accomplishes this using detach()
and attach() resulting in the new BB being attached - BB17 here - by the first
incoming edge and the previous first incoming edge - from BB10 in this case -
is now the second, but without a corresponding reorder of the phi node sources.

AFAICT the problem is that attach() or detach() don't preserve the incoming
edge/phi source correspondence. They shouldn't be used during SSA.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434567578.52207C0.18119
Date: Wed, 17 Jun 2015 18:59:38 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>Note that I really do have no clue of the whole system and only a very rough
understanding of SSA, but I think your result is the same as mine. The targets
of the newly inserted mov instructions are fine, because the PhiMoves pass
inserts them corresponding to mthe new phi sources, but the sources are
reversed, because the edges have been reordered (ironically by the PhiMoves
pass itself).

An edge newly attached using attach will always be the first in iteration
order. Therefore the problem happens as follows: when - as is the case here -
the second edge fulfills the needsNewElseBlock() condition it will be split to
insert the new BB for the copies. The old code accomplishes this using detach()
and attach() resulting in the new BB being attached - BB17 here - by the first
incoming edge and the previous first incoming edge - from BB10 in this case -
is now the second, but without a corresponding reorder of the phi node sources.

AFAICT the problem is that attach() or detach() don't preserve the incoming
edge/phi source correspondence. They shouldn't be used during SSA.</pre>
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

--1434567578.52207C0.18119--

--===============0139523473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0139523473==--
