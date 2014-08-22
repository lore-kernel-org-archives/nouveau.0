From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70931] Xv causes player segfaults when 4K is decoded
Date: Fri, 22 Aug 2014 01:29:34 +0000
Message-ID: <bug-70931-8800-idQgBJYtRL@http.bugs.freedesktop.org/>
References: <bug-70931-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1194432820=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70931-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1194432820==
Content-Type: multipart/alternative; boundary="1408670974.CdEdc3C3.22670"; charset="us-ascii"


--1408670974.CdEdc3C3.22670
Date: Fri, 22 Aug 2014 01:29:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70931

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 105069
  --> https://bugs.freedesktop.org/attachment.cgi?id=105069&action=edit
patch

Untested patch to get rid of the wrong size check. Unfortunately at query time
we aren't passed the port pointer by the DDX API. Instead check it at PutImage
time and return a BadMatch if you do something bad.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408670974.CdEdc3C3.22670
Date: Fri, 22 Aug 2014 01:29:34 +0000
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
   title="NEW --- - Xv causes player segfaults when 4K is decoded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70931#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xv causes player segfaults when 4K is decoded"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70931">bug 70931</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=105069" name="attach_105069" title="patch">attachment 105069</a> <a href="attachment.cgi?id=105069&amp;action=edit" title="patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=70931&amp;attachment=105069'>[review]</a>
patch

Untested patch to get rid of the wrong size check. Unfortunately at query time
we aren't passed the port pointer by the DDX API. Instead check it at PutImage
time and return a BadMatch if you do something bad.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408670974.CdEdc3C3.22670--

--===============1194432820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1194432820==--
