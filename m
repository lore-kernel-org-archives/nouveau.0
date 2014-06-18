From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Wed, 18 Jun 2014 07:51:22 +0000
Message-ID: <bug-79823-8800-bR0pLpmXS6@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0983558917=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0983558917==
Content-Type: multipart/alternative; boundary="1403077882.a81b8Dbe0.27683"; charset="us-ascii"


--1403077882.a81b8Dbe0.27683
Date: Wed, 18 Jun 2014 07:51:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #22 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 101283
  --> https://bugs.freedesktop.org/attachment.cgi?id=101283&action=edit
Valgrind glxtest logs

Valgrind glxtest logs:
10.2.1 (clear);
10.2.1-reverted (without bisectred patch);
10.2.1-bufctx (avoid dangling... patch);
10.2.1-leaks (plug some memory leaks... patch);
10.2.1-bufctx_leaks (both patches)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403077882.a81b8Dbe0.27683
Date: Wed, 18 Jun 2014 07:51:22 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=101283" name="attach_101283" title="Valgrind glxtest logs">attachment 101283</a> <a href="attachment.cgi?id=101283&amp;action=edit" title="Valgrind glxtest logs">[details]</a></span>
Valgrind glxtest logs

Valgrind glxtest logs:
10.2.1 (clear);
10.2.1-reverted (without bisectred patch);
10.2.1-bufctx (avoid dangling... patch);
10.2.1-leaks (plug some memory leaks... patch);
10.2.1-bufctx_leaks (both patches)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403077882.a81b8Dbe0.27683--

--===============0983558917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0983558917==--
