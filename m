From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Fri, 16 Jan 2015 23:29:19 +0000
Message-ID: <bug-61731-8800-r6fd0YIUt3@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0220822211=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0220822211==
Content-Type: multipart/alternative; boundary="1421450959.4BbbeE2.3051"; charset="UTF-8"


--1421450959.4BbbeE2.3051
Date: Fri, 16 Jan 2015 23:29:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|UNCONFIRMED                 |NEEDINFO
     Ever confirmed|0                           |1

--- Comment #15 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to Ronald from comment #14)
> Well,
> 
> what I did to solve it was to completely (!!!) remove all traces of the
> binary nvidia driver, this is expained somewhere on the nouveau website. You
> really have to dig quite deep. Simply apt-get remove was not enough.
> 
> Now i have it in a state that I can live with:
> - does not boot OK when powerplug is connected
> - but boot (in 99% of the cases) fine when powerplug is unplugged
> 
> This was the best I could make of it.
> 


Is this still a problem with a recent kernel? (3.17/3.18)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421450959.4BbbeE2.3051
Date: Fri, 16 Jan 2015 23:29:19 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>UNCONFIRMED
           </td>
           <td>NEEDINFO
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Ever confirmed</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to Ronald from <a href="show_bug.cgi?id=61731#c14">comment #14</a>)
<span class="quote">&gt; Well,
&gt; 
&gt; what I did to solve it was to completely (!!!) remove all traces of the
&gt; binary nvidia driver, this is expained somewhere on the nouveau website. You
&gt; really have to dig quite deep. Simply apt-get remove was not enough.
&gt; 
&gt; Now i have it in a state that I can live with:
&gt; - does not boot OK when powerplug is connected
&gt; - but boot (in 99% of the cases) fine when powerplug is unplugged
&gt; 
&gt; This was the best I could make of it.
&gt; </span >


Is this still a problem with a recent kernel? (3.17/3.18)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421450959.4BbbeE2.3051--

--===============0220822211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0220822211==--
