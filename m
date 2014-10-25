From: John Mountcastle <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: linux kernel  3.17, freeze on resume
Date: Sat, 25 Oct 2014 07:25:46 -0700
Message-ID: <1414247146.47116.YahooMailNeo@web162805.mail.bf1.yahoo.com>
Reply-To: John Mountcastle <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0197525497=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0197525497==
Content-Type: multipart/alternative; boundary="1735733242-1879820727-1414247146=:47116"

--1735733242-1879820727-1414247146=:47116
Content-Type: text/plain; charset=us-ascii

This may not be the proper place to raise this question but I've had little luck elsewhere.
After trying again, unsuccessfully this time, to install the proprietary NVIDIA driver, I've decided to focus my efforts on the open source Nouveau driver. I've seen video drivers blamed for varying degrees of "freeze on resume" but I'm not certain that's what I'm up against. When I resume after hibernate, Plymouth fails then I get a completely inert machine. Lights are on but keyboard nor mouse will elicit any response. If I go to another machine and ssh to a shell and do, #systemctl restart gdm, a clean Xdisplay pops up showing the log in screen. Now all is well. I'm running Gnome 3 on kernel 3.17.1-302.fc21.x86_64 on an HP Elitebook 8440p with NVIDIA GT218N [NVS 3100M] GPU, 8 GIG RAM and SSD. Can you help me help you to help me?
Do you suppose this is an as yet unreported driver bug or something else. It may be interesting to note that about one time in five to seven, the machine hangs on a reboot before getting anything at all onto the screen.
__________________
Never believe the set of that which you understand rivals the universe of that which may go wrong -- mtcstle

--1735733242-1879820727-1414247146=:47116
Content-Type: text/html; charset=us-ascii

<html><body><div style="color:#000; background-color:#fff; font-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font-size:12px"><div class="" style="">This may not be the proper place to raise this question but I've had little luck elsewhere.</div><div id="post_message_1713026" style="font-family: verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif, sans;" class=""><span style="font-size: 13px;">After trying again, unsuccessfully this time, to install the proprietary NVIDIA driver, I've decided to focus my efforts on the open source Nouveau driver. I've seen video drivers blamed for varying degrees of "freeze on resume" but I'm not certain that's what I'm up against. When I resume after hibernate, Plymouth fails then I get a completely i
 nert machine. Lights are on but keyboard nor mouse will elicit any response. If I go to another machine and ssh to a shell and do, #systemctl restart gdm, a clean
 Xdisplay pops up showing the log in screen. Now all is well. I'm running Gnome 3 on kernel 3.17.1-302.fc21.x86_64 on an HP Elitebook 8440p with NVIDIA GT218N [NVS 3100M] GPU, 8 GIG RAM and SSD. Can you help me help you to help me?</span></div><div id="post_message_1713026" style="font-family: verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif, sans;" class=""><span style="font-size: 13px;">Do you suppose this is an as yet unreported driver bug or something else. It may be interesting to note that about one time in five to seven, the machine hangs on a reboot before getting anything at all onto the screen.</span></div><div style="font-family: verdana, geneva, lucida, 'lucida grande', arial, helvetica, sans-serif, sans; font-size: 11px;" class="">__________________<br cl
 ass="" style="">Never believe the set of that which you understand rivals the universe of that which may go wrong -- mtcstle</div><div class="" style=""><br class=""
 style=""></div></div></body></html>
--1735733242-1879820727-1414247146=:47116--

--===============0197525497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0197525497==--
