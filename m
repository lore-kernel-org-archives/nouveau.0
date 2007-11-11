From: "Wladimir van der Laan" <laanwj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv50 microcode/shader format
Date: Sun, 11 Nov 2007 22:04:15 +0100
Message-ID: <3a7f9e660711111304j840c257vb5f12d495ddecca3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1416115531=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1416115531==
Content-Type: multipart/alternative;
	boundary="----=_Part_15655_19810301.1194815055740"

------=_Part_15655_19810301.1194815055740
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello there,

With the use of CUDA and ptx I managed to make a disassembler for at least
one of the nv50 microcode/shader formats. This might come in handy for some
people, hence I'm posting it here:

http://www.cs.rug.nl/~wladimir/decuda/

I'm not yet sure if pixel/vertex shaders use the same instruction format as
the compute shaders used by CUDA, but you'd think so, as nv50 is supposed to
have unified shader units. If anyone can help me a bit in finding the shader
instructions in valgrind-mmt-extend of mmiotrace dumps that'd be a great
help. I haven't had much luck yet with that. Is there a way to "pretty
print" the output of those programs, I mean, fill in the registers already
known?

Greetings,
Wladimir J. van der Laan

------=_Part_15655_19810301.1194815055740
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello there,<br><br>With the use of CUDA and ptx I managed to make a disassembler for at least one of the nv50 microcode/shader formats. This might come in handy for some people, hence I&#39;m posting it here:<br><br><a href="http://www.cs.rug.nl/~wladimir/decuda/">
http://www.cs.rug.nl/~wladimir/decuda/</a><br><br>I&#39;m not yet sure if pixel/vertex shaders use the same instruction format as the compute shaders used by CUDA, but you&#39;d think so, as nv50 is supposed to have unified shader units. If anyone can help me a bit in finding the shader instructions in valgrind-mmt-extend of mmiotrace dumps that&#39;d be a great help. I haven&#39;t had much luck yet with that. Is there a way to &quot;pretty print&quot; the output of those programs, I mean, fill in the registers already known?
<br><br>Greetings,<br>Wladimir J. van der Laan<br><br>

------=_Part_15655_19810301.1194815055740--

--===============1416115531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1416115531==--
