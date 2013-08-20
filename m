From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68348] [piglit] shaders/glsl-array-bounds-02 (+even
 nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001
Date: Tue, 20 Aug 2013 20:41:19 +0000
Message-ID: <bug-68348-8800-RD8kQAHjRu@http.bugs.freedesktop.org/>
References: <bug-68348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0179684446=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68348-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0179684446==
Content-Type: multipart/alternative; boundary="1377031279.bb8Ae2A2.21322"; charset="us-ascii"


--1377031279.bb8Ae2A2.21322
Date: Tue, 20 Aug 2013 20:41:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68348

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The big difference between the even and odd numbered
shaders/glsl-array-bounds-* seems to be how the invalid index comes about.

In the odd-numbered ones, it comes directly from shader code, e.g.:

void main() {
  int idx = 20;
  array[idx]
}

In the even-numbered ones, it comes from a uniform that I guess is passed in:

uniform int idx;

void main() {
  array[idx]
}

(And the various tests check fragment/vertex shaders, positive/negative
offsets, and the place where the idx comes from, so 8 tests total.)

Although I'm not sure there's actually a problem here... the program is doing
something illegal. You get segfault notifications in dmesg too...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377031279.bb8Ae2A2.21322
Date: Tue, 20 Aug 2013 20:41:19 +0000
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
   title="NEW --- - [piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68348#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [piglit] shaders/glsl-array-bounds-02 (+even nrs) produces TRAP , TRAP_MP - TP0: Unhandled ustatus 0x00000001"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68348">bug 68348</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The big difference between the even and odd numbered
shaders/glsl-array-bounds-* seems to be how the invalid index comes about.

In the odd-numbered ones, it comes directly from shader code, e.g.:

void main() {
  int idx = 20;
  array[idx]
}

In the even-numbered ones, it comes from a uniform that I guess is passed in:

uniform int idx;

void main() {
  array[idx]
}

(And the various tests check fragment/vertex shaders, positive/negative
offsets, and the place where the idx comes from, so 8 tests total.)

Although I'm not sure there's actually a problem here... the program is doing
something illegal. You get segfault notifications in dmesg too...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377031279.bb8Ae2A2.21322--

--===============0179684446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0179684446==--
