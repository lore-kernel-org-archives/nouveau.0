From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83957] [NV50 - NVAF][MCP89] Major screen corruption
 and X crash soon after log in
Date: Thu, 18 Sep 2014 14:49:51 +0000
Message-ID: <bug-83957-8800-eOlsIYxEha@http.bugs.freedesktop.org/>
References: <bug-83957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1480500639=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83957-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1480500639==
Content-Type: multipart/alternative; boundary="1411051791.aD3851.5026"; charset="us-ascii"


--1411051791.aD3851.5026
Date: Thu, 18 Sep 2014 14:49:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83957

--- Comment #6 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 106504
  --> https://bugs.freedesktop.org/attachment.cgi?id=106504&action=edit
PFB patch

I wonder if this patch could yield some improvements, as your chipset is not
too far away from mine (MCP79: NVAC) and I had kind of similar problems at some
point.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411051791.aD3851.5026
Date: Thu, 18 Sep 2014 14:49:51 +0000
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
   title="NEW --- - [NV50 - NVAF][MCP89] Major screen corruption and X crash soon after log in"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83957#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50 - NVAF][MCP89] Major screen corruption and X crash soon after log in"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83957">bug 83957</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=106504" name="attach_106504" title="PFB patch">attachment 106504</a> <a href="attachment.cgi?id=106504&amp;action=edit" title="PFB patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=83957&amp;attachment=106504'>[review]</a>
PFB patch

I wonder if this patch could yield some improvements, as your chipset is not
too far away from mine (MCP79: NVAC) and I had kind of similar problems at some
point.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411051791.aD3851.5026--

--===============1480500639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1480500639==--
