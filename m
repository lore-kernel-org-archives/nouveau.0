From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 03 Oct 2014 14:29:15 +0000
Message-ID: <bug-27501-8800-KOpTltGljF@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0901118072=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0901118072==
Content-Type: multipart/alternative; boundary="1412346555.5ecf00e6.5733"; charset="UTF-8"


--1412346555.5ecf00e6.5733
Date: Fri, 3 Oct 2014 14:29:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #106804|0                           |1
        is obsolete|                            |

--- Comment #42 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Created attachment 107262
  --> https://bugs.freedesktop.org/attachment.cgi?id=107262&action=edit
Fix acceleration on 9400M v2

Here is an updated version of the patch.

Thomas,
Do you still get screen corruption with it? (I can't reliably reproduce the
screen corruption unfortunately.)
GDM seems to work fine on my laptop with only 9400M having acceleration
enabled. I'll try with 9600M GT acceleration enabled too. :/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412346555.5ecf00e6.5733
Date: Fri, 3 Oct 2014 14:29:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #106804 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c42">Comment # 42</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=107262" name="attach_107262" title="Fix acceleration on 9400M v2">attachment 107262</a> <a href="attachment.cgi?id=107262&amp;action=edit" title="Fix acceleration on 9400M v2">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=27501&amp;attachment=107262'>[review]</a>
Fix acceleration on 9400M v2

Here is an updated version of the patch.

Thomas,
Do you still get screen corruption with it? (I can't reliably reproduce the
screen corruption unfortunately.)
GDM seems to work fine on my laptop with only 9400M having acceleration
enabled. I'll try with 9600M GT acceleration enabled too. :/</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412346555.5ecf00e6.5733--

--===============0901118072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0901118072==--
