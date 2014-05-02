From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Fri, 02 May 2014 17:17:21 +0000
Message-ID: <bug-54700-8800-P2Hj5cvreK@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775728680=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1775728680==
Content-Type: multipart/alternative; boundary="1399051041.dEFbD0014.665"; charset="us-ascii"


--1399051041.dEFbD0014.665
Date: Fri, 2 May 2014 17:17:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #63 from nv28m <nv28m-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> ---
For the first two options I think it could be useful to grep through all those
dumps collected over the years and check which cards have this set.

Option 3 could definately tell if it's only used for a particular memory
configuration of this chip, or it's more general (e.g. first 2 options).

By the way I've checked again my earlier claim about being slower after
suspend, and it's definately like that. Scrolling is more or less smooth
(considering the age of hardware and the resolution used) after kexec-ing from
nvidia to nouveau.

But after a suspend it's really "choppy" (same software still running, nothing
was changed). The speed is similarly slow after a clean boot too, so it's not a
suspend problem. Somewhere the handbrake needs to be released I guess...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399051041.dEFbD0014.665
Date: Fri, 2 May 2014 17:17:21 +0000
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
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c63">Comment # 63</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics (double cursor) with GeForce 4200Go (NV28)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:nv28m&#64;freemail.hu" title="nv28m &lt;nv28m&#64;freemail.hu&gt;"> <span class="fn">nv28m</span></a>
</span></b>
        <pre>For the first two options I think it could be useful to grep through all those
dumps collected over the years and check which cards have this set.

Option 3 could definately tell if it's only used for a particular memory
configuration of this chip, or it's more general (e.g. first 2 options).

By the way I've checked again my earlier claim about being slower after
suspend, and it's definately like that. Scrolling is more or less smooth
(considering the age of hardware and the resolution used) after kexec-ing from
nvidia to nouveau.

But after a suspend it's really &quot;choppy&quot; (same software still running, nothing
was changed). The speed is similarly slow after a clean boot too, so it's not a
suspend problem. Somewhere the handbrake needs to be released I guess...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399051041.dEFbD0014.665--

--===============1775728680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1775728680==--
