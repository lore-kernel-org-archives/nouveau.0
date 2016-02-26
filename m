From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Fri, 26 Feb 2016 10:57:35 +0000
Message-ID: <bug-91954-8800-27N7KX6UAQ@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971834674=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0971834674==
Content-Type: multipart/alternative; boundary="14564842554.DbE9.6198";
 charset="UTF-8"


--14564842554.DbE9.6198
Date: Fri, 26 Feb 2016 10:57:35 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=91954

Géza Búza <bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #7 from Géza Búza <bghome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 121981
  --> https://bugs.freedesktop.org/attachment.cgi?id=121981&action=edit
Kernel log of detaching and re-attaching external monitor

By looking at the log, my theory is that sometimes nouveau does not store the
preferred mode correctly when probing for available modes and tries to set an
invalid mode later.

In error_connecting_monitor.log at line 344 the list of available modes can be
seen for screen attached via display port. The native mode is 1920x1080, so the
Modeline 67 should be remembered. Now if you look at the line 392, you will see
that Modeline 52 is set instead, which is not on the list of allowed modes.

Can any developer confirm this?

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14564842554.DbE9.6198
Date: Fri, 26 Feb 2016 10:57:35 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bghome&#64;gmail.com" title="Géza Búza &lt;bghome&#64;gmail.com&gt;"> <span class="fn">Géza Búza</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>bghome&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - &quot;link training failed&quot;: nouveau does not recover from monitor suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91954">bug 91954</a>
              from <span class="vcard"><a class="email" href="mailto:bghome&#64;gmail.com" title="Géza Búza &lt;bghome&#64;gmail.com&gt;"> <span class="fn">Géza Búza</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=121981" name="attach_121981" title="Kernel log of detaching and re-attaching external monitor">attachment 121981</a> <a href="attachment.cgi?id=121981&amp;action=edit" title="Kernel log of detaching and re-attaching external monitor">[details]</a></span>
Kernel log of detaching and re-attaching external monitor

By looking at the log, my theory is that sometimes nouveau does not store the
preferred mode correctly when probing for available modes and tries to set an
invalid mode later.

In error_connecting_monitor.log at line 344 the list of available modes can be
seen for screen attached via display port. The native mode is 1920x1080, so the
Modeline 67 should be remembered. Now if you look at the line 392, you will see
that Modeline 52 is set instead, which is not on the list of allowed modes.

Can any developer confirm this?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14564842554.DbE9.6198--

--===============0971834674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0971834674==--
