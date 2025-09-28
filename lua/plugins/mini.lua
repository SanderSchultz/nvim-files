return {
	--Lets you do ciq (change inside quotes) cif (change inside function) cib (change inside brackets)
	{
		'echasnovski/mini.ai',
		version = '*',
		config = function()
			require('mini.ai').setup()
		end
	}
}
