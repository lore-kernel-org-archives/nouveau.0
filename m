From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Fri, 10 Jan 2014 19:47:01 +0000
Message-ID: <bug-21273-8800-ZNw4XeRqhP@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0657737130=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0657737130==
Content-Type: multipart/alternative; boundary="1389383221.BBCea2601.3627"; charset="us-ascii"


--1389383221.BBCea2601.3627
Date: Fri, 10 Jan 2014 19:47:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #85443|0                           |1
        is obsolete|                            |

--- Comment #93 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 91839
  --> https://bugs.freedesktop.org/attachment.cgi?id=91839&action=edit
log loading kernel from git

I tried to add only one line:
fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);

I see white horizontal lines on the screen and all hung up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389383221.BBCea2601.3627
Date: Fri, 10 Jan 2014 19:47:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #85443 is obsolete</td>
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c93">Comment # 93</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=91839" name="attach_91839" title="log loading kernel from git">attachment 91839</a> <a href="attachment.cgi?id=91839&amp;action=edit" title="log loading kernel from git">[details]</a></span>
log loading kernel from git

I tried to add only one line:
fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, all_heads, 2);

I see white horizontal lines on the screen and all hung up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389383221.BBCea2601.3627--

--===============0657737130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0657737130==--
